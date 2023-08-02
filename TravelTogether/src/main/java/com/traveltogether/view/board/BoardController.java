package com.traveltogether.view.board;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Path;
import java.nio.file.Paths;
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

	@RequestMapping(value="/insertBoard", method = RequestMethod.GET)
	public String insertBoardGet(Model model) {
		
		return"boardWrite";
	}
	
	@RequestMapping(value="/insertBoard", produces = "application/json; charset=utf8", method = RequestMethod.POST)
	public String insertBoardPost(BoardVO board, HttpSession session, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		board.setMember_id((String)session.getAttribute("userId"));
		
		if(board.getBoard_end_date().isEmpty()) {
			board.setBoard_end_date(null);
		}
		
		BoardImageVO image = new BoardImageVO();
		//파일업로드
		MultipartFile uploadFile = board.getUploadFile();
		if( !uploadFile.isEmpty() ) { //업로드한 파일의 존재여부
			
			String uuid = UUID.randomUUID().toString();
			Path targetPath = FileUtils.saveFile(uploadFile,uuid);
			image.setBoard_image_file(
					uuid+"_"+
					uploadFile.getOriginalFilename());
			
			String pathToday = FileUtils.getPathToday().toString().replace("\\", "/");
			image.setBoard_image_file_path("board/boardImage/"+pathToday.substring(pathToday.length()-10,pathToday.length()));
			
		}else {
			//이미지 없으면 선택한 축제의 기본 이미지 가져오기
			//jpg인지 png인지 확인해서 맞는 걸로 연결하기
			File file = new File("C:\\Users\\admin\\Desktop\\TravelTogether\\TravelTogether\\src\\main\\webapp\\resources\\image\\festival"
					+board.getFestival_name()+"\\"+board.getFestival_name()+"_1_공공3유형.jpg");
			if(file.exists()) {
				image.setBoard_image_file(board.getFestival_name()+"_1_공공3유형.jpg");
			}else {
				image.setBoard_image_file(board.getFestival_name()+"_1_공공3유형.png");
			}
			
			image.setBoard_image_file_path("festival/"+board.getFestival_name());
		}
		
		
		//제한수 체크 테이블에 값이 있는지 확인하고 있으면 update 없으면 insert
		BoardLimitVO limit = new BoardLimitVO();
		limit.setFestival_name(board.getFestival_name());
		limit.setMember_id((String)session.getAttribute("userId"));
		
		if(boardService.getOneBoardLimit(limit)!=null) {
				boardService.updateBoardLimit(limit);
		}else {
			boardService.insertBoardLimit(limit);
		}
		
		boardService.insertBoard(board);
		//이미지 테이블에 저장
		image.setBoard_number(board.getBoard_number());
		boardService.insertBoardImage(image);
		
		return "redirect:boardList";
	}
	
	//게시글 작성갯수 확인
	@RequestMapping(value = "/limitCheck", produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<Object,Object> boardLimitCheck(@RequestBody BoardLimitVO boardLimit, HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
		
		Map<Object,Object> map = new HashMap<Object, Object>();
		int limit = 0;
		if(boardService.getOneBoardLimit(boardLimit)!=null) {
			limit = boardService.boardLimitCheck(boardLimit);
		}
		
		map.put("limit", limit);
		
		return map;
	}
	
//	@RequestMapping(value = "/boardList")
//	public String getBoardList(Criteria criteria, ModelMap model, HttpSession session) throws IOException {
//		
//		BoardPageCreate pageCreate = new BoardPageCreate();
//		pageCreate.setCriteria(criteria);
//		pageCreate.setTotalCount(boardService.getTotalBoardCount());
//		
//		model.addAttribute("boardList", boardService.getBoardListwithPaging(criteria));
//		model.addAttribute("pageCreate", pageCreate);
//		model.addAttribute("comments", boardService.getTotalCommentCount());
//		//System.out.println(boardService.getBoardListwithPaging(criteria).toString());
//		
//		return "views/boardList.jsp";
//	}
	
	@RequestMapping(value = "/board")
	public String getBoard(BoardVO board, BoardImageVO boardImage, HttpServletRequest request, Model model) {
		
		boardService.viewCount(Integer.parseInt(request.getParameter("no")));
		model.addAttribute("board", boardService.getOneBoard(Integer.parseInt(request.getParameter("no"))));
		model.addAttribute("commentList", boardService.getCommnetList(Integer.parseInt(request.getParameter("no"))));
		model.addAttribute("reCommentList", boardService.getReCommnetList(Integer.parseInt(request.getParameter("no"))));
		
		return "board";
	}
	
	@RequestMapping(value = "/updateBoard", method = RequestMethod.GET)
	public String updateBoardGet(BoardVO board, BoardImageVO boardImage, FestivalVO festival, Model model, HttpServletRequest request) {
		
		model.addAttribute("board",boardService.getOneBoardForUpdate(Integer.parseInt(request.getParameter("no"))));
		return "boardUpdate";
	}
	@RequestMapping(value = "/updateBoard", method = RequestMethod.POST)
	public String updateBoardPost(BoardListVO boardList, BoardVO board, HttpServletRequest request) throws IOException {
		
		//파일업로드
		MultipartFile uploadFile = board.getUploadFile();
		if( !uploadFile.isEmpty() ) { //새로 업로드한 파일의 존재여부
			//기존에 있던 board_image 해당 데이터 지우고 수정하기(파일 위치는 그대로하고 파일만 바꿔도 될것같다)
			//기존에 있던 사진파일 지우기
			String path = "C:\\Users\\admin\\Desktop\\TravelTogether\\TravelTogether\\src\\main\\webapp\\resources\\image\\board\\boardImage";
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
			boardList.setBoard_image_file_path("board/boardImage/"+pathToday.substring(pathToday.length()-10,pathToday.length()));
		}
		else { //사진은 수정 안했을 경우
			boardList.setBoard_image_file(boardList.getBoard_image_file_old());
			boardList.setBoard_image_file_path(boardList.getBoard_image_file_path());
		}

		//1박 이상 선택 안했을 시 null로 넘어가게 하기
		if(boardList.getBoard_end_date().isEmpty()) {
			boardList.setBoard_end_date(null);
		}
		
		boardService.updateBoard(boardList);

		return "redirect:boardList";
	}
	
	@RequestMapping(value = "/deleteBoard")
	public String deleteBoard (HttpServletRequest request, HttpSession session) {
		//limit count-1하기
		BoardListVO boardList = boardService.getOneBoard(Integer.parseInt(request.getParameter("no")));
		BoardLimitVO limit = new BoardLimitVO();
		limit.setFestival_name(boardList.getFestival_name());
		limit.setMember_id((String)session.getAttribute("userId"));
		boardService.minusBoardLimit(limit);
		//이미지값 삭제후 게시글 삭제
		boardService.deleteBoardImage(Integer.parseInt(request.getParameter("no")));
		boardService.deleteBoard(Integer.parseInt(request.getParameter("no")));
		
		return "redirect:boardList";
	}
	
	@RequestMapping(value = "/findFestivalBoard")
	public String findFestivalBaord (Criteria criteria, ModelMap model) {
		criteria.setFestival_name(criteria.getFestival_name().trim());
		
		BoardPageCreate pageCreate = new BoardPageCreate();
		pageCreate.setCriteria(criteria);
		pageCreate.setTotalCount(boardService.getTotalFestivalBoardCount(criteria)); //해당 축제의 개수만 받아오기
		
		model.addAttribute("boardList", boardService.getFestivalBoardListwithPaging(criteria));
		model.addAttribute("pageCreate", pageCreate);
		
		return "boardList";
	}
	
	//게시판 댓글
	@RequestMapping(value = "/insertComment")
	@ResponseBody
	public Map<Object,Object> insertComment(@RequestBody CommentVO comment) {
		Map<Object,Object> map = new HashMap<Object, Object>();
		//댓글이 db등록에 성공하면 등록된 댓글 번호(pk)랑 success 반환
		boardService.insertComment(comment);
		
		if(boardService.getOneComment(comment.getComment_number())==null) {
			map.put("success", "fail");
		}
		else {
			map.put("comment", boardService.getOneComment(comment.getComment_number()));
			map.put("success", "success");
		}
		
		
		return map;
	}
	//답글
	@RequestMapping(value = "/insertReComment")
	@ResponseBody
	public Map<Object, Object> insertreComment(@RequestBody CommentVO comment){
		Map<Object,Object> map = new HashMap<Object, Object>();
		
		comment.setComment_depth(1);
		comment.setComment_group(comment.getComment_number());
		boardService.insertComment(comment);
		if(boardService.getOneComment(comment.getComment_number())==null) {
			map.put("success", "fail");
		}
		else {
			map.put("comment", boardService.getOneComment(comment.getComment_number()));
			map.put("success", "success");
		}
		
		return map;
	}
	
	@RequestMapping(value = "/updateComment")
	@ResponseBody
	public Map<Object, Object> updateComment(@RequestBody CommentVO comment){
		Map<Object,Object> map = new HashMap<Object, Object>();
		
		boardService.updateComment(comment);
		map.put("success", "success");
		
		return map;
	}
	
	@RequestMapping(value = "/deleteComment")
	@ResponseBody
	public Map<Object, Object> deleteComment(@RequestBody CommentVO comment){
		Map<Object,Object> map = new HashMap<Object, Object>();
		
		int count = boardService.getReCommentTotal(comment.getComment_number());
		if(count > 0) {
			boardService.pretendDeleteComment(comment);
			map.put("success", "haveReComment");
		}else {
			boardService.deleteComment(comment);
			map.put("success", "successDelete");
		}
		
		return map;
	}
	
}
