package com.springbook.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.board.B_MoodVO;
import com.springbook.biz.board.BoardPages;
import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.NoticeVO;
import com.springbook.biz.board.PageSize;
import com.springbook.biz.user.UserVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService  {
	
	@Autowired
	private BoardDAOMybatis boardDAO;

	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
		boardDAO.insertMood();
	}

	public void insertNotice(NoticeVO nvo) {
		boardDAO.insertNotice(nvo);
		
	}
	
	public void goodOrBad(B_MoodVO vo) {
		boardDAO.goodOrBad(vo);
	}
	
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteAllC_Mood(vo);
		boardDAO.deleteAllComment(vo);
		boardDAO.deleteB_Mood(vo);
		boardDAO.deleteBoard(vo);
	}

	public void deleteNotice(NoticeVO nvo) {
		boardDAO.deleteNotice(nvo);
	}

	public BoardVO getBoard(BoardVO vo) {
		boardDAO.increaseCount(vo);
		return boardDAO.getBoard(vo);
	}
	public NoticeVO getNotice(NoticeVO nvo) {
		return boardDAO.getNotice(nvo);
	}
	
	public List<NoticeVO> getNoticeList() {
		return boardDAO.getNoticeList();
	}

	public B_MoodVO getMood(B_MoodVO mvo) {
		return boardDAO.getMood(mvo);
	}
	
	public BoardPages<BoardVO> getBoardPages(int pageNo,BoardVO vo) {
		int totalBoardCount = boardDAO.getBoardCount();
		vo.setStartRow(((pageNo-1) * 10)+1);
		vo.setEndRow((pageNo * 10));
		List<BoardVO> boardList = boardDAO.getBoardPages(vo);
		return new BoardPages<BoardVO>(totalBoardCount, pageNo, 10, boardList);
	}
	
	public List<BoardVO> getBestList(BoardVO vo){
		return boardDAO.getBestList(vo);
	}

	@Override
	public BoardPages<NoticeVO> getNoticePages(int pageNo, NoticeVO vo) {
		int totalBoardCount = boardDAO.getNoticeCount();
		vo.setStartRow(((pageNo-1) * 10)+1);
		vo.setEndRow((pageNo * 10));
		List<NoticeVO> boardList = boardDAO.getNoticePages(vo);
		return new BoardPages<NoticeVO>(totalBoardCount, pageNo, 10, boardList);
	}

	@Override
	public BoardPages<BoardVO> getBoardUserPages(int pageNo, BoardVO vo, String name) {
		int totalBoardCount = boardDAO.getBoardCount();
		vo.setStartRow(((pageNo-1) * 10)+1);
		vo.setEndRow((pageNo * 10));
		vo.setName(name);
		List<BoardVO> boardList = boardDAO.getBoardUserPages(vo);
		return new BoardPages<BoardVO>(totalBoardCount, pageNo, 10, boardList);
	}



}