package com.springbook.biz.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.board.B_HistoryDTO;
import com.springbook.biz.comment.BestCommentDTO;
import com.springbook.biz.comment.C_HistoryDTO;
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
		CommentDAO.deleteC_History(vo);
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
	public void goodOrBad(C_MoodVO vo,C_HistoryDTO dto) throws Exception {
		List<C_HistoryDTO> result = CommentDAO.c_historyCheck();
		dto.setComment_no(vo.getCommentNo());
		dto.setNo(vo.getNo());
		if(result.isEmpty()) {
			CommentDAO.goodOrBad(vo);
			CommentDAO.insertC_History(dto);
			return;
		}else if(!result.isEmpty()) {
			
			for (int j = 0; j < result.size(); j++) {
				if( result.get(j).getMem_code().equals(dto.getMem_code()) && result.get(j).getComment_no() == vo.getCommentNo() && result.get(j).getNo() == vo.getNo() ) {
					throw new IllegalAccessError();
				}else {
					CommentDAO.goodOrBad(vo);
					CommentDAO.insertC_History(dto);
					return;
					
				}
			}
		}
		
	}

	
}
