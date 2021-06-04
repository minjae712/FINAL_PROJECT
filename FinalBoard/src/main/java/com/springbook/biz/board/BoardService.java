package com.springbook.biz.board;

import java.util.List;

import com.springbook.biz.user.UserVO;

public interface BoardService {

	void insertBoard(BoardVO vo);
	
	void insertNotice(NoticeVO nvo);
	
	void goodOrBad(B_MoodVO vo);

	void updateBoard(BoardVO vo);

	void deleteBoard(BoardVO vo);
	
	void deleteNotice(NoticeVO nvo);

	BoardVO getBoard(BoardVO vo);
	
	NoticeVO getNotice(NoticeVO nvo);
	
	List<NoticeVO> getNoticeList();
	
	B_MoodVO getMood(B_MoodVO mvo);
	
	BoardPages getBoardPages(int pageNo,BoardVO vo);
	
	List<BoardVO> getBestList(BoardVO vo);
	
	void reservation(UserVO vo);
}
