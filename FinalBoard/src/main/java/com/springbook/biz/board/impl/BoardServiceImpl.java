package com.springbook.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.board.B_HistoryDTO;
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
		boardDAO.insertB_Mood();
	}

	public void insertNotice(NoticeVO nvo) {
		boardDAO.insertNotice(nvo);
		
	}
	
	public void goodOrBad(B_MoodVO vo,B_HistoryDTO dto) throws Exception {
		List<B_HistoryDTO> result = boardDAO.b_historyCheck();
		dto.setNo(vo.getNo());
		if(result.isEmpty()) {
			boardDAO.goodOrBad(vo);
			boardDAO.insertB_History(dto);
		}else if(!result.isEmpty()) {
			
			for (int j = 0; j < result.size(); j++) {
				if(result.get(j).getMem_code().equals(dto.getMem_code()) && result.get(j).getNo() == vo.getNo()) {
					throw new IllegalAccessError();
				}else {
					boardDAO.goodOrBad(vo);
					boardDAO.insertB_History(dto);
					break;
					
				}
			}
		}
	}
	
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteB_History(vo);
		boardDAO.deleteAllC_History(vo);
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



}