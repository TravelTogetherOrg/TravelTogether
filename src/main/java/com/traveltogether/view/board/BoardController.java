package com.traveltogether.view.board;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.traveltogether.biz.board.BoardImageVO;
import com.traveltogether.biz.board.BoardLimitVO;
import com.traveltogether.biz.board.BoardPageCreate;
import com.traveltogether.biz.board.BoardService;
import com.traveltogether.biz.board.BoardVO;
import com.traveltogether.biz.board.Criteria;
import com.traveltogether.biz.board.repository.BoardRepository;


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
		return"/views/boardWrite.jsp";
	}
	
	//@Transactional
	@RequestMapping(value="/insertBoard.do", method = RequestMethod.POST) //@ModelAttribute("boardVO")
	public String insertBoardPost(BoardVO board, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String ID = (String)session.getAttribute("ID");
		
		board.setMember_id("test"); //로그인 기능 구현시 ID로 변경
		board.setFestival_name("축제명");
		
		//이미지는 mysql에 프로시저로 생성해야할듯..?
		
		//파일업로드
		/*
		MultipartFile uploadFile = board.getUploadFile();
		if( !uploadFile.isEmpty() ) { //업로드한 파일의 존재여부
			//업로드된 파일 이름
			String fileName = uploadFile.getOriginalFilename();
			//저장할 경로
			uploadFile.transferTo(new File("C:\\Users\\user\\Desktop\\KCY\\spring_file\\"+fileName));
			
			//image.setBoard_image_file(fileName);
			//image.setBoard_image_file_path("C:\\Users\\user\\Desktop\\KCY\\spring_file\\");
		}else {
			//이미지 없으면 선택한 축제의 기본 이미지 가져오기,,,
			
		}
		*/
		//제한수 체크 테이블에 값이 있는지 확인하고 있으면 update 없으면 insert
		BoardLimitVO limit = new BoardLimitVO();
		limit.setFestival_name("축제명");
		limit.setMember_id("test");
		
		if(boardService.getOneBoardLimit(limit)!=null) {
			if(boardService.getOneBoardLimit(limit).getBoard_limit_count()>3) {
				//3회 이상인지를 boardWrite.jsp에서 ajax으로 받아서 arlet창을 띄우는게 좋을 듯
				System.out.println("00축제의 동행글을 3회 이상 작성하셨습니다."
						+ "하나이상의 게시글을 지우고 다시 작성해주세요.");
			}else {
				boardService.updateBoardLimit(limit);
			}
		}else {
			boardService.insertBoardLimit(limit);
		}
		
		
		System.out.println(board.toString());
		
		boardService.insertBoard(board);
		
		return "redirect:main.jsp";
	}
	
	@RequestMapping(value = "/boardList.do")
	public String getBoardList(Criteria criteria , ModelMap model) {
		BoardPageCreate pageCreate = new BoardPageCreate();
		pageCreate.setCriteria(criteria);
		pageCreate.setTotalCount(boardService.getTotalBoardCount());
		
		System.out.println(pageCreate);
		
		model.addAttribute("boardList", boardService.getBoardListwithPaging(criteria));
		model.addAttribute("pageCreate", pageCreate);
		
		return "/views/boardList.jsp";
	}
	
	@RequestMapping(value = "/board.do")
	public String getBoard(BoardVO board, HttpServletRequest request, Model model) {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//format.
		//board.setBoard_write_date(format.format(board.getBoard_write_date()));
		board.setBoard_number(Integer.parseInt(request.getParameter("no")));
		model.addAttribute("board", boardService.getOneBoard(board.getBoard_number()));
		return "/views/board.jsp";
	}
}
