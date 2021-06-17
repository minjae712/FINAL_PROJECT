package com.springbook.biz.P_comment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.P_comment.P_BestCommentDTO;
import com.springbook.biz.P_comment.P_C_HistoryDTO;
import com.springbook.biz.P_comment.P_C_MoodVO;
import com.springbook.biz.P_comment.P_CommentVO;

@Repository
public class P_CommentDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertComment(P_CommentVO vo) {
		mybatis.insert("P_CommentDAO.insertP_Comment", vo);
	}
	
	public void insertMood(P_CommentVO vo) {
		mybatis.insert("P_CommentDAO.insertP_Mood", vo);
	}
	public void insertC_History(P_C_HistoryDTO dto) {
		mybatis.insert("P_CommentDAO.insertP_C_History", dto);
	}
	
	public void updateComment(P_CommentVO vo) {
		mybatis.update("P_CommentDAO.updateP_Comment", vo);
	}

	public void deleteComment(P_CommentVO vo) {
		mybatis.delete("P_CommentDAO.deleteP_Comment", vo);
	}

	public void deleteMood(P_CommentVO vo) {
		mybatis.delete("P_CommentDAO.deleteP_Mood", vo);
	}

	public void deleteC_History(P_CommentVO vo) {
		mybatis.delete("P_CommentDAO.deleteP_C_History", vo);
	}

	public P_CommentVO textAreaSet(P_CommentVO vo) {
		return (P_CommentVO) mybatis.selectOne("P_CommentDAO.textAreaSet", vo);
	}

	public List<P_C_HistoryDTO> P_c_historyCheck() {
		return mybatis.selectList("P_CommentDAO.c_historyCheck");
	}
	
	public int getCommentCount(P_CommentVO vo) {
		return mybatis.selectOne("P_CommentDAO.getP_CommentCount",vo);
	}
	
	public List<P_CommentVO> getCommentList(P_CommentVO vo) {
		return mybatis.selectList("P_CommentDAO.getP_CommentList", vo);
	}

	public List<P_BestCommentDTO> getBestCommentList(P_BestCommentDTO dto) {
		return mybatis.selectList("P_CommentDAO.getP_BestCommentList", dto);
	}

	public List<P_C_MoodVO> getCommentMood(P_C_MoodVO vo) {
		return mybatis.selectList("P_CommentDAO.getP_CommentMood", vo);
	}

	public void goodOrBad(P_C_MoodVO vo) {
		mybatis.update("P_CommentDAO.goodOrBad", vo);
	}
	

}