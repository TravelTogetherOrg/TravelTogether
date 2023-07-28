package com.traveltogether.biz.board;

import java.util.List;

public interface BoardService {
	
	//board 테이블
	public void insertBoard(BoardVO board);
	public void updateBoard(BoardListVO board);
	public void deleteBoard(int boardNumber);
	public BoardListVO getOneBoard(int boardNumber);
	public BoardListVO getOneBoardForUpdate(int boardNumber);
	public List<BoardVO> getUserBoardList(String id);
	public void viewCount(int boardNumber);
	//페이징
	public List<BoardVO> getBoardListwithPaging(Criteria criteria);
	public int getTotalBoardCount();
	//축제별 게시판 리스트
	public List<BoardVO> getFestivalBoardListwithPaging(Criteria criteria);
	public int getTotalFestivalBoardCount(Criteria criteria);
	
	//board_limit 테이블
	public int boardLimitCheck(BoardLimitVO boardLimit);
	public void insertBoardLimit(BoardLimitVO boardLimit);
	public void updateBoardLimit(BoardLimitVO boardLimit);
	public BoardLimitVO getOneBoardLimit(BoardLimitVO boardLimit);
	public void minusBoardLimit(BoardLimitVO boardLimit);
	
	//board_image 테이블
	public void insertBoardImage(BoardImageVO boardImage);
	public void deleteBoardImage(int boardNumber);
	public BoardImageVO getOneBoardImage(BoardImageVO boardImage);
	
	//comment 게시판 댓글
	public void insertComment(CommentVO comment);
	public void deleteComment(CommentVO comment);
	public void pretendDeleteComment(CommentVO comment);
	public void updateComment(CommentVO comment);
	public CommentVO getOneComment(int commentNumber);
	public List<CommentVO> getCommnetList(int boardNumber);
	public List<CommentVO> getReCommnetList(int boardNumber);
	//public int getCommentTotal(int boardNumber);
	public int getReCommentTotal(int commentNumber);
	public List<CommentVO> getTotalCommentCount();
}
