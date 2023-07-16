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
	
	//@Transactional
	@RequestMapping(value="/insertBoard.do", method = RequestMethod.POST) //@ModelAttribute("boardVO")
	public String insertBoardPost(BoardVO board, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String ID = (String)session.getAttribute("ID");
		
		board.setMember_id("xbj3812@gmail.com"); //濡쒓렇�씤 湲곕뒫 援ы쁽�떆 ID濡� 蹂�寃�
		board.setFestival_name("강릉문화재야행");
		
		//�씠誘몄��뒗 mysql�뿉 �봽濡쒖떆��濡� �깮�꽦�빐�빞�븷�벏..?
		
		//�뙆�씪�뾽濡쒕뱶
		/*
		MultipartFile uploadFile = board.getUploadFile();
		if( !uploadFile.isEmpty() ) { //�뾽濡쒕뱶�븳 �뙆�씪�쓽 議댁옱�뿬遺�
			//�뾽濡쒕뱶�맂 �뙆�씪 �씠由�
			String fileName = uploadFile.getOriginalFilename();
			//���옣�븷 寃쎈줈
			uploadFile.transferTo(new File("C:\\Users\\user\\Desktop\\KCY\\spring_file\\"+fileName));
			
			//image.setBoard_image_file(fileName);
			//image.setBoard_image_file_path("C:\\Users\\user\\Desktop\\KCY\\spring_file\\");
		}else {
			//�씠誘몄� �뾾�쑝硫� �꽑�깮�븳 異뺤젣�쓽 湲곕낯 �씠誘몄� 媛��졇�삤湲�,,,
			
		}
		*/
		//�젣�븳�닔 泥댄겕 �뀒�씠釉붿뿉 媛믪씠 �엳�뒗吏� �솗�씤�븯怨� �엳�쑝硫� update �뾾�쑝硫� insert
		/*
		BoardLimitVO limit = new BoardLimitVO();
		limit.setFestival_name("異뺤젣紐�");
		limit.setMember_id("test");
		
		if(boardService.getOneBoardLimit(limit)!=null) {
			if(boardService.getOneBoardLimit(limit).getBoard_limit_count()>3) {
				//3�쉶 �씠�긽�씤吏�瑜� boardWrite.jsp�뿉�꽌 ajax�쑝濡� 諛쏆븘�꽌 arlet李쎌쓣 �쓣�슦�뒗寃� 醫뗭쓣 �벏
				System.out.println("00異뺤젣�쓽 �룞�뻾湲��쓣 3�쉶 �씠�긽 �옉�꽦�븯�뀲�뒿�땲�떎."
						+ "�븯�굹�씠�긽�쓽 寃뚯떆湲��쓣 吏��슦怨� �떎�떆 �옉�꽦�빐二쇱꽭�슂.");
			}else {
				boardService.updateBoardLimit(limit);
			}
		}else {
			boardService.insertBoardLimit(limit);
		}
		
		*/
		System.out.println(board.toString());
		
		boardService.insertBoard(board);
		
		return "main.jsp";
	}
	
	@RequestMapping(value = "/boardList.do")
	public String getBoardList(Criteria criteria , ModelMap model) {
		BoardPageCreate pageCreate = new BoardPageCreate();
		pageCreate.setCriteria(criteria);
		pageCreate.setTotalCount(boardService.getTotalBoardCount());
		
		System.out.println(pageCreate);
		
		model.addAttribute("boardList", boardService.getBoardListwithPaging(criteria));
		model.addAttribute("pageCreate", pageCreate);
		
		return "views/boardList.jsp";
	}
	
	@RequestMapping(value = "/board.do")
	public String getBoard(BoardVO board, HttpServletRequest request, Model model) {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//format.
		//board.setBoard_write_date(format.format(board.getBoard_write_date()));
		board.setBoard_number(Integer.parseInt(request.getParameter("no")));
		model.addAttribute("board", boardService.getOneBoard(board.getBoard_number()));
		return "views/board.jsp";
	}
}
