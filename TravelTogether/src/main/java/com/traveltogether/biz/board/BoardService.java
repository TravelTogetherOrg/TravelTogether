package com.traveltogether.biz.board;

import java.util.List;

public interface BoardService {
	
	//public void saveBoard(BoardVO board); //등록, 수정
	//board 테이블
	public void insertBoard(BoardVO board);
	public void updateBoard(BoardListVO board);
	public void deleteBoard(int boardNumber);
	public BoardVO getOneBoard(int boardNumber);
	public BoardListVO getOneBoardForUpdate(int boardNumber);
	public List<BoardVO> getUserBoardList(String id);
	//페이징
	public List<BoardVO> getBoardListwithPaging(Criteria criteria);
	public int getTotalBoardCount ();
	
	//board_limit 테이블
	public int boardLimitCheck(BoardLimitVO boardLimit);
	public void insertBoardLimit(BoardLimitVO boardLimit);
	public void updateBoardLimit(BoardLimitVO boardLimit);
	public BoardLimitVO getOneBoardLimit(BoardLimitVO boardLimit);
	
	//board_image 테이블
	public void insertBoardImage(BoardImageVO boardImage);
	public BoardImageVO getOneBoardImage(BoardImageVO boardImage);
}
