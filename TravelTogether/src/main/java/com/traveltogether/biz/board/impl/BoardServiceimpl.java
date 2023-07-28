package com.traveltogether.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveltogether.biz.board.BoardImageVO;
import com.traveltogether.biz.board.BoardLimitVO;
import com.traveltogether.biz.board.BoardListVO;
import com.traveltogether.biz.board.BoardService;
import com.traveltogether.biz.board.BoardVO;
import com.traveltogether.biz.board.CommentVO;
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
	public void updateBoard(BoardListVO board) {
		boardDAO.updateBoard(board);
		
	}

	@Override
	public void deleteBoard(int boardNumber) {
		boardDAO.deleteBoard(boardNumber);
		
	}

	@Override
	public BoardListVO getOneBoard(int boardNumber) {
		
		return boardDAO.getOneBoard(boardNumber);
	}
	
	@Override
	public BoardListVO getOneBoardForUpdate(int boardNumber) {
		
		return boardDAO.getOneBoardForUpdate(boardNumber);
	}

	@Override
	public List<BoardVO> getUserBoardList(String id) {
		
		return boardDAO.getUserBoardList(id);
	}

	@Override
	public void viewCount(int boardNumber) {
		boardDAO.viewCount(boardNumber);
		
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
	public void minusBoardLimit(BoardLimitVO boardLimit) {
		boardDAO.minusBoardLimit(boardLimit);
		
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

	@Override
	public int boardLimitCheck(BoardLimitVO boardLimit) {
		
		return boardDAO.boardLimitCheck(boardLimit);
	}

	@Override
	public void insertBoardImage(BoardImageVO boardImage) {
		boardDAO.insertBoardImage(boardImage);
		
	}

	@Override
	public BoardImageVO getOneBoardImage(BoardImageVO boardImage) {
		
		return boardDAO.getOneBoardImage(boardImage);
	}

	@Override
	public void deleteBoardImage(int boardNumber) {
		boardDAO.deleteBoardImage(boardNumber);
		
	}

	@Override
	public List<BoardVO> getFestivalBoardListwithPaging(Criteria criteria) {
		
		return boardDAO.getFestivalBoardListwithPaging(criteria);
	}
	
	@Override
	public int getTotalFestivalBoardCount(Criteria criteria) {
		
		return boardDAO.getTotalFestivalBoardCount(criteria);
	}

	@Override
	public void insertComment(CommentVO comment) {
		boardDAO.insertComment(comment);
		
	}

	@Override
	public void deleteComment(CommentVO comment) {
		boardDAO.deleteComment(comment);
		
	}

	@Override
	public void updateComment(CommentVO comment) {
		boardDAO.updateComment(comment);
		
	}

	@Override
	public List<CommentVO> getCommnetList(int boardNumber) {
		
		return boardDAO.getCommnetList(boardNumber);
	}
	
	@Override
	public CommentVO getOneComment(int commentNumber) {
		return boardDAO.getOneComment(commentNumber);
		
	}

	@Override
	public List<CommentVO> getReCommnetList(int boardNumber) {
		
		return boardDAO.getReCommnetList(boardNumber);
	}

	@Override
	public void pretendDeleteComment(CommentVO comment) {
		boardDAO.pretendDeleteComment(comment);
		
	}

	@Override
	public int getReCommentTotal(int commentNumber) {
		
		return boardDAO.getReCommentTotal(commentNumber);
	}

	@Override
	public List<CommentVO> getTotalCommentCount() {
		
		return boardDAO.getTotalCommentCount();
	}


}
