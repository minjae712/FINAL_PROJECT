package com.springbook.biz.P_comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.P_comment.P_BestCommentDTO;
import com.springbook.biz.P_comment.P_C_HistoryDTO;
import com.springbook.biz.P_comment.P_C_MoodVO;
import com.springbook.biz.P_comment.P_CommentService;
import com.springbook.biz.P_comment.P_CommentVO;

@Service("P_CommentService")
public class P_CommentServiceImpl implements P_CommentService{

	@Autowired
	private P_CommentDAO P_CommentDAO;
	
	public void insertP_Comment(P_CommentVO vo) {
		P_CommentDAO.insertComment(vo);
		P_CommentDAO.insertMood(vo);
	}

	public void updateP_Comment(P_CommentVO vo) {
		P_CommentDAO.updateComment(vo);
	}

	public void deleteP_Comment(P_CommentVO vo) {
		P_CommentDAO.deleteC_History(vo);
		P_CommentDAO.deleteMood(vo);
		P_CommentDAO.deleteComment(vo);
	}

	public int getP_CommentCount(P_CommentVO vo) {
		return P_CommentDAO.getCommentCount(vo);
	}

	public List<P_CommentVO> getP_CommentList(P_CommentVO vo) {
		return P_CommentDAO.getCommentList(vo);
	}

	public List<P_BestCommentDTO> getP_BestCommentList(P_BestCommentDTO dto) {
		return P_CommentDAO.getBestCommentList(dto);
	}

	public List<P_C_MoodVO> getP_CommentMood(P_C_MoodVO vo) {
		return P_CommentDAO.getCommentMood(vo);
	}

	@Override
	public P_CommentVO textAreaSet(P_CommentVO vo) {
		return P_CommentDAO.textAreaSet(vo);
	}

	@Override
	public void goodOrBad(P_C_MoodVO vo,P_C_HistoryDTO dto) throws Exception {
		List<P_C_HistoryDTO> result = P_CommentDAO.P_c_historyCheck();
		dto.setComment_no(vo.getCommentNo());
		dto.setNo(vo.getNo());
		if(result.isEmpty()) {
			P_CommentDAO.goodOrBad(vo);
			P_CommentDAO.insertC_History(dto);
			return;
		}else if(!result.isEmpty()) {
			
			for (int j = 0; j < result.size(); j++) {
				if( result.get(j).getMem_code().equals(dto.getMem_code()) && result.get(j).getComment_no() == vo.getCommentNo() && result.get(j).getNo() == vo.getNo() ) {
					throw new IllegalAccessError();
				}else {
					P_CommentDAO.goodOrBad(vo);
					P_CommentDAO.insertC_History(dto);
					return;
					
				}
			}
		}
		
	}

	
}
