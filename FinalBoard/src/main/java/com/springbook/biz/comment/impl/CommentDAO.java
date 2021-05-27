package com.springbook.biz.comment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.comment.BestCommentDTO;
import com.springbook.biz.comment.C_MoodVO;
import com.springbook.biz.comment.CommentVO;

@Repository
public class CommentDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertComment(CommentVO vo) {
		mybatis.insert("CommentDAO.insertComment", vo);
	}
	
	public void insertMood(CommentVO vo) {
		mybatis.insert("CommentDAO.insertMood", vo);
	}
	
	public void updateComment(CommentVO vo) {
		mybatis.update("CommentDAO.updateComment", vo);
	}

	public void deleteComment(CommentVO vo) {
		mybatis.delete("CommentDAO.deleteComment", vo);
	}

	public void deleteMood(CommentVO vo) {
		mybatis.delete("CommentDAO.deleteMood", vo);
	}

	public CommentVO textAreaSet(CommentVO vo) {
		return (CommentVO) mybatis.selectOne("CommentDAO.textAreaSet", vo);
	}
	
	public int getCommentCount(CommentVO vo) {
		return mybatis.selectOne("CommentDAO.getCommentCount",vo);
	}
	
	public List<CommentVO> getCommentList(CommentVO vo) {
		return mybatis.selectList("CommentDAO.getCommentList", vo);
	}

	public List<BestCommentDTO> getBestCommentList(BestCommentDTO dto) {
		return mybatis.selectList("CommentDAO.getBestCommentList", dto);
	}

	public List<C_MoodVO> getCommentMood(C_MoodVO vo) {
		return mybatis.selectList("CommentDAO.getCommentMood", vo);
	}

	public void goodOrBad(C_MoodVO vo) {
		mybatis.update("CommentDAO.goodOrBad", vo);
	}
	

}