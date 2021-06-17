package com.springbook.biz.P_comment;

import java.util.List;

public interface P_CommentService {

	void insertP_Comment(P_CommentVO vo);
	
	void goodOrBad(P_C_MoodVO vo,P_C_HistoryDTO dto) throws Exception;
	
	void updateP_Comment(P_CommentVO vo);

	void deleteP_Comment(P_CommentVO vo);
	
	int getP_CommentCount(P_CommentVO vo);
	
	List<P_C_MoodVO> getP_CommentMood(P_C_MoodVO vo);
		
	P_CommentVO textAreaSet(P_CommentVO vo);
	
	List<P_BestCommentDTO> getP_BestCommentList(P_BestCommentDTO dto);
	
	List<P_CommentVO> getP_CommentList(P_CommentVO vo);
}
