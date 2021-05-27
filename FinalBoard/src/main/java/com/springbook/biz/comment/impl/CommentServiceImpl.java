package com.springbook.biz.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.comment.BestCommentDTO;
import com.springbook.biz.comment.C_MoodVO;
import com.springbook.biz.comment.CommentPages;
import com.springbook.biz.comment.CommentService;
import com.springbook.biz.comment.CommentVO;
import com.springbook.biz.comment.PageSize;

@Service("CommentService")
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDAO CommentDAO;
	
	public void insertComment(CommentVO vo) {
		CommentDAO.insertComment(vo);
		CommentDAO.insertMood(vo);
	}

	public void updateComment(CommentVO vo) {
		CommentDAO.updateComment(vo);
	}

	public void deleteComment(CommentVO vo) {
		CommentDAO.deleteMood(vo);
		CommentDAO.deleteComment(vo);
	}

	public int getCommentCount(CommentVO vo) {
		return CommentDAO.getCommentCount(vo);
	}

	public List<CommentVO> getCommentList(CommentVO vo) {
		return CommentDAO.getCommentList(vo);
	}

	public List<BestCommentDTO> getBestCommentList(BestCommentDTO dto) {
		return CommentDAO.getBestCommentList(dto);
	}

	public List<C_MoodVO> getCommentMood(C_MoodVO vo) {
		return CommentDAO.getCommentMood(vo);
	}

	@Override
	public CommentVO textAreaSet(CommentVO vo) {
		return CommentDAO.textAreaSet(vo);
	}

	@Override
	public void goodOrBad(C_MoodVO vo) {
		CommentDAO.goodOrBad(vo);
	}

	
}
