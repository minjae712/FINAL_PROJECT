package com.springbook.biz.comment;

import java.util.List;

public interface CommentService {

	void insertComment(CommentVO vo);
	
	void goodOrBad(C_MoodVO vo,C_HistoryDTO dto) throws Exception;
	
	void updateComment(CommentVO vo);

	void deleteComment(CommentVO vo);
	
	int getCommentCount(CommentVO vo);
	
	List<C_MoodVO> getCommentMood(C_MoodVO vo);
		
	CommentVO textAreaSet(CommentVO vo);
	
	List<BestCommentDTO> getBestCommentList(BestCommentDTO dto);
	
	List<CommentVO> getCommentList(CommentVO vo);
}
