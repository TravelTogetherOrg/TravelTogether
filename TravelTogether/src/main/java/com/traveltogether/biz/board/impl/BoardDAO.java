package com.traveltogether.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.traveltogether.biz.board.BoardImageVO;
import com.traveltogether.biz.board.BoardLimitVO;
import com.traveltogether.biz.board.BoardListVO;
import com.traveltogether.biz.board.BoardService;
import com.traveltogether.biz.board.BoardVO;
import com.traveltogether.biz.board.CommentVO;
import com.traveltogether.biz.board.Criteria;
@Repository("boardDAO")
public class BoardDAO implements BoardService {

	@Autowired
	private SqlSessionTemplate mybatis;
	/*private BoardRepository boardRepository;*/
	
	@Override
	public void insertBoard(BoardVO board) {
		mybatis.insert("BoardDAO.insertBoard", board);
		
	}

	@Override
	public void updateBoard(BoardListVO board) {
		
		mybatis.update("BoardDAO.updateBoard", board);
	}
	@Override
	public void deleteBoard(int boardNumber) {
		
		mybatis.delete("BoardDAO.deleteBoard", boardNumber);
		
	}

	@Override
	public BoardListVO getOneBoard(int boardNumber) {
		
		//return boardRepository.findById(boardNumber).get();
		return mybatis.selectOne("BoardDAO.getOneBoard", boardNumber);
	}

	@Override
	public BoardListVO getOneBoardForUpdate(int boardNumber) {
		
		return mybatis.selectOne("BoardDAO.getOneBoardForUpdate",boardNumber);
	}

	@Override
	public List<BoardVO> getUserBoardList(String id) {
		
		//return boardRepository.findByMemberId(id);
		return mybatis.selectList("BoardDAO.getMemberBoardList", id);
		
	}
	
	@Override
	public void viewCount(int boardNumber) {
		mybatis.update("BoardDAO.countBoard", boardNumber);
		
	}
	
	//board_limit
	@Override
	public void insertBoardLimit(BoardLimitVO boardLimit) {

		mybatis.insert("BoardDAO.insertBoardLimit", boardLimit);
		
	}

	@Override
	public void updateBoardLimit(BoardLimitVO boardLimit) {
		
		mybatis.update("BoardDAO.updateBoardLimit", boardLimit);
		
	}
	
	@Override
	public void minusBoardLimit(BoardLimitVO boardLimit) {
		mybatis.update("BoardDAO.minusBoardLimit",boardLimit);
		
	}

	@Override
	public BoardLimitVO getOneBoardLimit(BoardLimitVO boardLimit) {
		
		return mybatis.selectOne("BoardDAO.getOneBoardLimit", boardLimit);
	}

	@Override
	public List<BoardVO> getBoardListwithPaging(Criteria criteria) {
		
		return mybatis.selectList("BoardDAO.getBoardListwithPaging", criteria);
	}

	@Override
	public int getTotalBoardCount() {
		
		return mybatis.selectOne("BoardDAO.getTotalBoardCount");
	}

	@Override
	public int boardLimitCheck(BoardLimitVO boardLimit) {
		
		return mybatis.selectOne("BoardDAO.boardLimitCheck",boardLimit);
	}

	@Override
	public void insertBoardImage(BoardImageVO boardImage) {
		mybatis.insert("BoardDAO.insertBoardImage",boardImage);
		
	}

	@Override
	public BoardImageVO getOneBoardImage(BoardImageVO boardImage) {
		
		return mybatis.selectOne("BoardDAO.getOneboardIamge", boardImage);
	}

	@Override
	public void deleteBoardImage(int boardNumber) {
		mybatis.delete("BoardDAO.deleteBoardImage", boardNumber);
		
	}

	@Override
	public List<BoardVO> getFestivalBoardListwithPaging(Criteria criteria) {
		
		return mybatis.selectList("BoardDAO.getFestivalBoardListwithPaging", criteria);
	}
	
	@Override
	public int getTotalFestivalBoardCount(Criteria criteria) {
		
		return mybatis.selectOne("BoardDAO.getTotalFestivalBoardCount", criteria);
	}

	@Override
	public void insertComment(CommentVO comment) {
		mybatis.insert("BoardDAO.insertComment", comment);
		
	}

	@Override
	public void deleteComment(CommentVO comment) {
		mybatis.delete("BoardDAO.deleteComment",comment);
		
	}

	@Override
	public void updateComment(CommentVO comment) {
		mybatis.update("BoardDAO.updateComment",comment);
		
	}

	@Override
	public List<CommentVO> getCommnetList(int boardNumber) {
		
		return mybatis.selectList("BoardDAO.getCommentList", boardNumber);
	}

	@Override
	public CommentVO getOneComment(int commentNumber) {
		
		return mybatis.selectOne("BoardDAO.getOneComment", commentNumber);
	}

	@Override
	public List<CommentVO> getReCommnetList(int boardNumber) {
		
		return mybatis.selectList("BoardDAO.getReCommentList", boardNumber);
	}

	@Override
	public void pretendDeleteComment(CommentVO comment) {
		mybatis.update("BoardDAO.pretendDeleteComment", comment);
		
	}

	@Override
	public int getReCommentTotal(int commentNumber) {
		
		return mybatis.selectOne("BoardDAO.getReCommentCount", commentNumber);
	}

	@Override
	public List<CommentVO> getTotalCommentCount() {
		
		return mybatis.selectList("BoardDAO.getTotalCommentCount");
	}

}
