package com.traveltogether.biz;

import java.util.List;

import org.apache.log4j.Logger;

import org.hibernate.annotations.Loader;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.traveltogether.biz.board.BoardLimitVO;
import com.traveltogether.biz.board.BoardService;
import com.traveltogether.biz.board.BoardVO;
import com.traveltogether.biz.board.Criteria;
import com.traveltogether.biz.board.impl.BoardServiceimpl;


public class BoardPagingTest {
	
	private static final Logger logger = (Logger) LoggerFactory.getLogger(BoardServiceimpl.class);
	
	@Autowired
	private BoardService boardService;
	
	@Test
	public void testpagin() {
		
		Criteria cri = new Criteria();
		cri.setPageNumber(1);
		cri.setAmount(2);
		List<BoardVO> list = boardService.getBoardListwithPaging(cri); 
		list.forEach(board -> logger.info(board));

	}
	

}
