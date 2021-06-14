package com.springbook.biz.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.board.B_MoodVO;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.NoticeVO;
import com.springbook.biz.board.PageSize;
import com.springbook.biz.user.UserVO;

@Repository
public class BoardDAOMybatis{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertBoard(BoardVO vo) {
		System.out.println(vo.toString());
		mybatis.insert("BoardDAO.insertBoard", vo);
	}
	
	public void insertNotice(NoticeVO nvo) {
		mybatis.insert("BoardDAO.insertNotice", nvo);
	}

	public void insertMood() {
		mybatis.insert("BoardDAO.insertMood");
	}
	
	public void goodOrBad(B_MoodVO vo) {
		mybatis.insert("BoardDAO.goodOrBad",vo);
	}
	
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	public void increaseCount(BoardVO vo) {
		mybatis.update("BoardDAO.increaseCount",vo);
	}

	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}

	public void deleteB_Mood(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteB_Mood", vo);
	}

	public void deleteNotice(NoticeVO nvo) {
		mybatis.delete("BoardDAO.deleteNotice", nvo);
	}

	public BoardVO getBoard(BoardVO vo) {
		return (BoardVO) mybatis.selectOne("BoardDAO.getBoard", vo);
	}
	
	public NoticeVO getNotice(NoticeVO nvo) {
		return mybatis.selectOne("BoardDAO.getNotice", nvo);
	}

	public List<NoticeVO> getNoticeList() {
		return mybatis.selectList("BoardDAO.getNoticeList");
	}
	
	public B_MoodVO getMood(B_MoodVO mvo) {
		return mybatis.selectOne("BoardDAO.getMood", mvo);
	}
	
	public int getBoardCount() {
		return mybatis.selectOne("BoardDAO.getBoardCount");
	}

	public int getNoticeCount() {
		return mybatis.selectOne("BoardDAO.getNoticeCount");
	}

	public List<BoardVO> getBoardPages(BoardVO vo) {
		return mybatis.selectList("BoardDAO.getBoardPages",vo);
	}

	public List<BoardVO> getBoardUserPages(BoardVO vo) {
		return mybatis.selectList("BoardDAO.getBoardUserPages",vo);
	}
	
	public List<NoticeVO> getNoticePages(NoticeVO vo) {
		return mybatis.selectList("BoardDAO.getNoticePages",vo);
	}
	
	public List<BoardVO> getBestList(BoardVO vo){
		return mybatis.selectList("BoardDAO.getBestList",vo);
	}
	
	public void deleteAllComment(BoardVO vo){
		mybatis.delete("CommentDAO.deleteAllComment",vo);
	}

	public void deleteAllC_Mood(BoardVO vo){
		mybatis.delete("CommentDAO.deleteAllC_Mood",vo);
	}
}