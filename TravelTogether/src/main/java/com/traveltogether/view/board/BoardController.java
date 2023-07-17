package com.traveltogether.view.board;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.traveltogether.biz.board.BoardImageVO;
import com.traveltogether.biz.board.BoardLimitVO;
import com.traveltogether.biz.board.BoardListVO;
import com.traveltogether.biz.board.BoardPageCreate;
import com.traveltogether.biz.board.BoardService;
import com.traveltogether.biz.board.BoardVO;
import com.traveltogether.biz.board.Criteria;
import com.traveltogether.biz.board.FileUtils;
import com.traveltogether.biz.festival.FestivalVO;
import com.traveltogether.biz.festival.impl.FestivalServiceimpl;

@Controller
@SessionAttributes("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	//private BoardService boardService;
	
	//@Transactional
	@RequestMapping(value="/insertBoard.do", method = RequestMethod.GET)
	public String insertBoardGet(Model model) {
		//model.addAttribute("boardVO", new BoardVO());
		return"views/boardWrite.jsp";
	}
	
	//@Transactional, MultipartHttpServletRequest multipart
	@RequestMapping(value="/insertBoard.do", method = RequestMethod.POST) //@ModelAttribute("boardVO")
	public String insertBoardPost(BoardVO board, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String ID = (String)session.getAttribute("ID");
		
		board.setMember_id("xbj3812@gmail.com"); //로그인 기능 구현시 ID로 변경"xbj3812@gmail.com"
		//board.setFestival_name("강릉문화재야행");
		BoardImageVO image = new BoardImageVO();
		//파일업로드
		MultipartFile uploadFile = board.getUploadFile();
		if( !uploadFile.isEmpty() ) { //업로드한 파일의 존재여부
			
			String uuid = UUID.randomUUID().toString();
			Path targetPath = FileUtils.saveFile(uploadFile,uuid);
			//System.out.println("targetPath: "+targetPath);
			//System.out.println(uuid);
			//System.out.println("uploadFile: "+uploadFile.getOriginalFilename());
			image.setBoard_image_file(
					uuid+"_"+
					uploadFile.getOriginalFilename());
			
			String pathToday = FileUtils.getPathToday().toString().replace("\\", "/");
			//2023\07\16
			System.out.println("일지만 나오는지 확인: "+pathToday.substring(pathToday.length()-10,pathToday.length()));
			image.setBoard_image_file_path(pathToday.substring(pathToday.length()-10,pathToday.length()));
			
		}else {
			//이미지 없으면 선택한 축제의 기본 이미지 가져오기,,,
			
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
		//System.out.println("boardnum: "+board.getBoard_number());
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
	public String getBoardList(Criteria criteria , ModelMap model) {
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
		
		board.setBoard_number(Integer.parseInt(request.getParameter("no")));
		boardImage.setBoard_number(Integer.parseInt(request.getParameter("no")));
		
		model.addAttribute("board", boardService.getOneBoard(board.getBoard_number()));
		model.addAttribute("boardImage",boardService.getOneBoardImage(boardImage));
		return "views/board.jsp";
	}
	
	@RequestMapping(value = "/updateBoard.do", method = RequestMethod.GET)
	public String updateBoardGet(BoardVO board, BoardImageVO boardImage, FestivalVO festival, Model model, HttpServletRequest request) {
		
		model.addAttribute("board",boardService.getOneBoardForUpdate(Integer.parseInt(request.getParameter("no"))));
		return "views/boardUpdate.jsp";
	}
	@RequestMapping(value = "/updateBoard.do", method = RequestMethod.POST)
	public String updateBoardPost(BoardListVO boardList, BoardVO board, BoardImageVO image, HttpServletRequest request) throws IOException {
		System.out.println("oldImage: "+boardList.getBoard_image_file_old());
		System.out.println("newImage: "+boardList.getBoard_image_file());
		//파일업로드
		MultipartFile uploadFile = board.getUploadFile();
		if( !uploadFile.isEmpty() ) { //새로 업로드한 파일의 존재여부
			//기존에 있던 board_image 해당 데이터 지우고 수정하기(파일 위치는 그대로하고 파일만 바꿔도 될것같다)
			System.out.println("uploadFile"+uploadFile);
			String uuid = UUID.randomUUID().toString();
			Path targetPath = FileUtils.saveFile(uploadFile,uuid);
			System.out.println("targetPath: "+targetPath);
			System.out.println(uuid);
			System.out.println("uploadFile: "+uploadFile.getOriginalFilename());
			image.setBoard_image_file(
					uuid+"_"+
					uploadFile.getOriginalFilename());
			
			
			
		}
		else { //사진은 수정 안했을 경우
			boardList.setBoard_image_file(boardList.getBoard_image_file_old());
		}
		
		//boardService.updateBoard(boardList);
		return "redirect:boardList.do";
	}
}
