package com.traveltogether.biz.board;

import java.util.List;

public interface BoardService {
	
	//public void saveBoard(BoardVO board); //등록, 수정
	//board 테이블
	public void insertBoard(BoardVO board);
	public void updateBoard(BoardVO board);
	public void deleteBoard(int boardNumber);
	public BoardVO getOneBoard(int boardNumber);
	//public List<BoardVO> getBoardList();
	public List<BoardVO> getUserBoardList(String id);
	//페이징
	public List<BoardVO> getBoardListwithPaging(Criteria criteria);
	public int getTotalBoardCount ();
	
	//board_limit 테이블
	public void insertBoardLimit(BoardLimitVO boardLimit);
	public void updateBoardLimit(BoardLimitVO boardLimit);
	public BoardLimitVO getOneBoardLimit(BoardLimitVO boardLimit);
}
