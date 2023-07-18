package com.traveltogether.view.board;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.traveltogether.biz.board.BoardImageVO;
import com.traveltogether.biz.board.BoardLimitVO;
import com.traveltogether.biz.board.BoardListVO;
import com.traveltogether.biz.board.BoardPageCreate;
import com.traveltogether.biz.board.BoardService;
import com.traveltogether.biz.board.BoardVO;
import com.traveltogether.biz.board.CommentVO;
import com.traveltogether.biz.board.Criteria;
import com.traveltogether.biz.board.FileUtils;
import com.traveltogether.biz.festival.FestivalVO;

@Controller
@SessionAttributes("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	@RequestMapping(value="/insertBoard.do", method = RequestMethod.GET)
	public String insertBoardGet(Model model) {
		
		return"views/boardWrite.jsp";
	}
	
	@RequestMapping(value="/insertBoard.do", method = RequestMethod.POST) //@ModelAttribute("boardVO")
	public String insertBoardPost(BoardVO board, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String ID = (String)session.getAttribute("ID");
		
		board.setMember_id("xbj3812@gmail.com"); //로그인 기능 구현시 ID로 변경"xbj3812@gmail.com"
		BoardImageVO image = new BoardImageVO();
		//파일업로드
		MultipartFile uploadFile = board.getUploadFile();
		if( !uploadFile.isEmpty() ) { //업로드한 파일의 존재여부
			
			String uuid = UUID.randomUUID().toString();
			Path targetPath = FileUtils.saveFile(uploadFile,uuid);
			System.out.println("targetPath: "+targetPath);
			image.setBoard_image_file(
					uuid+"_"+
					uploadFile.getOriginalFilename());
			
			String pathToday = FileUtils.getPathToday().toString().replace("\\", "/");
			//2023\07\16
			System.out.println("일지만 나오는지 확인: "+pathToday.substring(pathToday.length()-10,pathToday.length()));
			image.setBoard_image_file_path("board/boardimage/"+pathToday.substring(pathToday.length()-10,pathToday.length()));
			
		}else {
			//이미지 없으면 선택한 축제의 기본 이미지 가져오기
			image.setBoard_image_file(board.getFestival_name()+"_1_공공3유형.jpg");
			image.setBoard_image_file_path("festival/"+board.getFestival_name());
		}
		
		
		//제한수 체크 테이블에 값이 있는지 확인하고 있으면 update 없으면 insert
		BoardLimitVO limit = new BoardLimitVO();
		limit.setFestival_name(board.getFestival_name());
		limit.setMember_id("xbj3812@gmail.com");
		if(boardService.getOneBoardLimit(limit)!=null) {
				boardService.updateBoardLimit(limit);
		}else {
			boardService.insertBoardLimit(limit);
		}

		System.out.println(board.toString());
		
		boardService.insertBoard(board);
		//이미지 테이블에 저장
		image.setBoard_number(board.getBoard_number());
		boardService.insertBoardImage(image);
		
		return "redirect:boardList.do";
	}
	
	//게시글 작성갯수 확인
	@RequestMapping(value = "/limitCheck.do")
	@ResponseBody
	public Map<Object,Object> boardLimitCheck(@RequestBody BoardLimitVO boardLimit) {
		Map<Object,Object> map = new HashMap<Object, Object>();
		int limit = 0;
		if(boardService.getOneBoardLimit(boardLimit)!=null) {
			limit = boardService.boardLimitCheck(boardLimit);
		}
		
		map.put("limit", limit);
		
		return map;
	}
	
	@RequestMapping(value = "/boardList.do")
	public String getBoardList(Criteria criteria, ModelMap model, HttpServletResponse response, HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		BoardPageCreate pageCreate = new BoardPageCreate();
		pageCreate.setCriteria(criteria);
		pageCreate.setTotalCount(boardService.getTotalBoardCount());
		
		model.addAttribute("boardList", boardService.getBoardListwithPaging(criteria));
		model.addAttribute("pageCreate", pageCreate);
		System.out.println(boardService.getBoardListwithPaging(criteria).toString());
		
		return "views/boardList.jsp";
	}
	
	@RequestMapping(value = "/board.do")
	public String getBoard(BoardVO board, BoardImageVO boardImage, HttpServletRequest request, Model model) {
		
		boardService.viewCount(Integer.parseInt(request.getParameter("no")));
		model.addAttribute("board", boardService.getOneBoard(Integer.parseInt(request.getParameter("no"))));
		return "views/board.jsp";
	}
	
	@RequestMapping(value = "/updateBoard.do", method = RequestMethod.GET)
	public String updateBoardGet(BoardVO board, BoardImageVO boardImage, FestivalVO festival, Model model, HttpServletRequest request) {
		
		model.addAttribute("board",boardService.getOneBoardForUpdate(Integer.parseInt(request.getParameter("no"))));
		return "views/boardUpdate.jsp";
	}
	@RequestMapping(value = "/updateBoard.do", method = RequestMethod.POST)
	public String updateBoardPost(BoardListVO boardList, BoardVO board, HttpServletRequest request) throws IOException {
		
		//파일업로드
		MultipartFile uploadFile = board.getUploadFile();
		if( !uploadFile.isEmpty() ) { //새로 업로드한 파일의 존재여부
			//기존에 있던 board_image 해당 데이터 지우고 수정하기(파일 위치는 그대로하고 파일만 바꿔도 될것같다)
			//기존에 있던 사진파일 지우기
			String path = "C:\\Users\\user\\Desktop\\KCY\\spring\\SpringSRC\\TT\\TravelTogether\\src\\main\\webapp\\resources\\image\\board\\boardImage\\";
			File file = new File(path +boardList.getBoard_image_file_path()+ "\\" + boardList.getBoard_image_file_old());
			
			if(file.exists()) { // 파일이 존재하면
				file.delete(); // 파일 삭제	
			}
			//새로 올린 파일 저장
			String uuid = UUID.randomUUID().toString();
			Path targetPath = FileUtils.saveFile(uploadFile,uuid);
			boardList.setBoard_image_file(
					uuid+"_"+
					uploadFile.getOriginalFilename());
			String pathToday = FileUtils.getPathToday().toString().replace("\\", "/");
			boardList.setBoard_image_file_path(pathToday.substring(pathToday.length()-10,pathToday.length()));
		}
		else { //사진은 수정 안했을 경우
			boardList.setBoard_image_file(boardList.getBoard_image_file_old());
			boardList.setBoard_image_file_path(boardList.getBoard_image_file_path());
		}
		//1박 이상 날짜 확인
		System.out.println("endDate: "+boardList.getBoard_end_date());
		if(boardList.getBoard_end_date()==null) {
			
		}
		
		//boardService.updateBoard(boardList);
		return "redirect:boardList.do";
	}
	
	@RequestMapping(value = "/deleteBoard.do")
	public String deleteBoard (HttpServletRequest request) {
		//limit count-1하기
		BoardListVO boardList = boardService.getOneBoard(Integer.parseInt(request.getParameter("no")));
		BoardLimitVO limit = new BoardLimitVO();
		limit.setFestival_name(boardList.getFestival_name());
		limit.setMember_id("xbj3812@gmail.com"); //boardList.getMember_id()
		boardService.minusBoardLimit(limit);
		//이미지값 삭제후 게시글 삭제
		boardService.deleteBoardImage(Integer.parseInt(request.getParameter("no")));
		boardService.deleteBoard(Integer.parseInt(request.getParameter("no")));
		
		return "redirect:boardList.do";
	}
	
	@RequestMapping(value = "/findFestivalBoard.do")
	public String findFestivalBaord (Criteria criteria, ModelMap model) {
		BoardPageCreate pageCreate = new BoardPageCreate();
		pageCreate.setCriteria(criteria);
		pageCreate.setTotalCount(boardService.getTotalBoardCount());
		System.out.println("축제검색: "+criteria.getFestival_name());
		criteria.setFestival_name(criteria.getFestival_name().trim());
		model.addAttribute("boardList", boardService.getFestivalBoardListwithPaging(criteria));
		model.addAttribute("pageCreate", pageCreate);
		
		return "views/boardList.jsp";
	}
	
	//게시판 댓글
	@RequestMapping(value = "/insertComment.do")
	@ResponseBody
	public Map<Object,Object> insertComment(@RequestBody CommentVO comment) {
		Map<Object,Object> map = new HashMap<Object, Object>();
		//댓글이 db등록에 성공하면 등록된 댓글 번호(pk)랑 success 반환
		
		return map;
	}
		
	
}
