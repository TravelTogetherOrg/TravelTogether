package com.traveltogether.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveltogether.biz.board.BoardImageVO;
import com.traveltogether.biz.board.BoardLimitVO;
import com.traveltogether.biz.board.BoardService;
import com.traveltogether.biz.board.BoardVO;
import com.traveltogether.biz.board.Criteria;
@Service("boardService")
public class BoardServiceimpl implements BoardService {
	
	//@Autowired
	//private boardDAO boardDAO;
	@Autowired
	private BoardService boardDAO;
	//private BoardRepository boardRepository;

	@Override
	public void insertBoard(BoardVO board) {
		boardDAO.insertBoard(board);
		
	}

	@Override
	public void updateBoard(BoardVO board) {
		boardDAO.updateBoard(board);
		
	}

	@Override
	public void deleteBoard(int boardNumber) {
		boardDAO.deleteBoard(boardNumber);
		
	}

	@Override
	public BoardVO getOneBoard(int boardNumber) {
		
		return boardDAO.getOneBoard(boardNumber);
	}

	@Override
	public List<BoardVO> getUserBoardList(String id) {
		
		return boardDAO.getUserBoardList(id);
	}

	
	//board_limit
	@Override
	public void insertBoardLimit(BoardLimitVO boardLimit) {
		boardDAO.insertBoardLimit(boardLimit);
		
	}

	@Override
	public void updateBoardLimit(BoardLimitVO boardLimit) {
		boardDAO.updateBoardLimit(boardLimit);
		
	}

	@Override
	public BoardLimitVO getOneBoardLimit(BoardLimitVO boardLimit) {
		
		return boardDAO.getOneBoardLimit(boardLimit);
	}

	@Override
	public List<BoardVO> getBoardListwithPaging(Criteria criteria) {
		
		return boardDAO.getBoardListwithPaging(criteria);
	}

	@Override
	public int getTotalBoardCount() {
		
		return boardDAO.getTotalBoardCount();
	}
	

	

}
