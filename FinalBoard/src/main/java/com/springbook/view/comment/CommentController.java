package com.springbook.view.comment;

import java.io.IOException;
import java.util.List;


import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbook.biz.comment.BestCommentDTO;
import com.springbook.biz.comment.C_HistoryDTO;
import com.springbook.biz.comment.C_MoodVO;
import com.springbook.biz.comment.CommentService;
import com.springbook.biz.comment.CommentVO;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService CommentService;
	
	
	@RequestMapping(value = "/insertComment.do")
	public @ResponseBody String ajax_insertComment(CommentVO vo) throws IOException {
		CommentService.insertComment(vo);
		return "success";
	}

	@RequestMapping(value = "/c_goodOrBad.do")
	public @ResponseBody String ajax_c_goodOrBad(C_MoodVO vo,C_HistoryDTO dto) throws Exception {
		CommentService.goodOrBad(vo,dto);
		vo.clear();
		return "success";
	}
	
	@RequestMapping("/updateComment.do")
	public @ResponseBody String ajax_updateComment(CommentVO vo) {
		CommentService.updateComment(vo);
		return "success";
	}

	@RequestMapping("/deleteComment.do")
	public @ResponseBody String ajax_deleteComment(CommentVO vo) {
		CommentService.deleteComment(vo);
		return "success";
	}

	@RequestMapping(value ="/getCommentCount.do")
	public @ResponseBody String ajax_getCommentCount(CommentVO vo) {
		int count = CommentService.getCommentCount(vo);
		return Integer.toString(count);
	}
	
	@RequestMapping(value ="/getCommentMood.do")
	public @ResponseBody String ajax_getCommentMood(C_MoodVO vo) {
		List<C_MoodVO> result = CommentService.getCommentMood(vo);
		JSONArray jsonArr = new JSONArray();
    	for (int i = 0; i < result.size(); i++) {
    		JSONObject json = new JSONObject();
    		
    		json.put("no", result.get(i).getNo());
    		json.put("commentNo", result.get(i).getCommentNo());
    		json.put("good", result.get(i).getGood());
    		json.put("bad", result.get(i).getBad());

    		jsonArr.put(json);
		}
		
		return jsonArr.toString();
	}

	@RequestMapping(value ="/textAreaSet.do")
	public @ResponseBody String ajax_textAreaSet(CommentVO vo) {
		CommentVO result = CommentService.textAreaSet(vo);
    	
		JSONObject json = new JSONObject();
		
		json.put("writer", result.getWriter());
		json.put("content", result.getContent());
		json.put("regDate", result.getRegDate());
		json.put("commentNo", result.getCommentNo());
		json.put("no", result.getNo());

    	return json.toString();
	}
	
	
    @RequestMapping(value="/getCommentList.do")
    public @ResponseBody String ajax_getCommentList(CommentVO vo) throws JSONException {
    	List<CommentVO> result = CommentService.getCommentList(vo);
    	
    	JSONArray jsonArr = new JSONArray();
    	
    	for (int i = 0; i < result.size(); i++) {
    		JSONObject json = new JSONObject();
    		
    		json.put("writer", result.get(i).getWriter());
    		json.put("content", result.get(i).getContent());
    		json.put("regDate", result.get(i).getRegDate());
    		json.put("commentNo", result.get(i).getCommentNo());
    		json.put("no", result.get(i).getNo());

    		jsonArr.put(json);
		}
    	return jsonArr.toString();
    }

    @RequestMapping(value="/getBestCommentList.do")
    public @ResponseBody String ajax_getBestCommentList(BestCommentDTO dto) throws JSONException {
    	List<BestCommentDTO> result = CommentService.getBestCommentList(dto);
    	
    	JSONArray jsonArr = new JSONArray();
    	
    	for (int i = 0; i < result.size(); i++) {
    		JSONObject json = new JSONObject();
    		
    		json.put("commentNo", result.get(i).getCommentNo());
    		json.put("no", result.get(i).getNo());
    		json.put("writer", result.get(i).getWriter());
    		json.put("content", result.get(i).getContent());
    		json.put("regDate", result.get(i).getRegDate());
    		json.put("good", result.get(i).getGood());
    		json.put("bad", result.get(i).getBad());
    		
    		jsonArr.put(json);
    	}
    	return jsonArr.toString();
    }

	

}
