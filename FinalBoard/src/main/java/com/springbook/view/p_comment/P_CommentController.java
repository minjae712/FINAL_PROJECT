package com.springbook.view.p_comment;

import java.io.IOException;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbook.biz.P_comment.P_BestCommentDTO;
import com.springbook.biz.P_comment.P_C_HistoryDTO;
import com.springbook.biz.P_comment.P_C_MoodVO;
import com.springbook.biz.P_comment.P_CommentService;
import com.springbook.biz.P_comment.P_CommentVO;

@Controller
public class P_CommentController {
	
	@Autowired
	private P_CommentService P_CommentService;
	
	
	@RequestMapping(value = "/insertP_Comment.do")
	public @ResponseBody String ajax_insertP_Comment(P_CommentVO vo) throws IOException {
		P_CommentService.insertP_Comment(vo);
		return "success";
	}

	@RequestMapping(value = "/p_goodOrBad.do")
	public @ResponseBody String ajax_p_goodOrBad(P_C_MoodVO vo,P_C_HistoryDTO dto) throws Exception {
		P_CommentService.goodOrBad(vo,dto);
		vo.clear();
		return "success";
	}
	
	@RequestMapping("/updateP_Comment.do")
	public @ResponseBody String ajax_updateP_Comment(P_CommentVO vo) {
		P_CommentService.updateP_Comment(vo);
		return "success";
	}

	@RequestMapping("/deleteP_Comment.do")
	public @ResponseBody String ajax_deleteP_Comment(P_CommentVO vo) {
		P_CommentService.deleteP_Comment(vo);
		return "success";
	}

	@RequestMapping(value ="/getP_CommentCount.do")
	public @ResponseBody String ajax_getP_CommentCount(P_CommentVO vo) {
		int count = P_CommentService.getP_CommentCount(vo);
		return Integer.toString(count);
	}
	
	@RequestMapping(value ="/getP_CommentMood.do")
	public @ResponseBody String ajax_getP_CommentMood(P_C_MoodVO vo) {
		List<P_C_MoodVO> result = P_CommentService.getP_CommentMood(vo);
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

	@RequestMapping(value ="/P_textAreaSet.do")
	public @ResponseBody String ajax_textAreaSet(P_CommentVO vo) {
		P_CommentVO result = P_CommentService.textAreaSet(vo);
    	
		JSONObject json = new JSONObject();
		
		json.put("writer", result.getWriter());
		json.put("content", result.getContent());
		json.put("regDate", result.getRegDate());
		json.put("commentNo", result.getCommentNo());
		json.put("no", result.getNo());

    	return json.toString();
	}
	
	
    @RequestMapping(value="/getP_CommentList.do")
    public @ResponseBody String ajax_getP_CommentList(P_CommentVO vo) throws JSONException {
    	List<P_CommentVO> result = P_CommentService.getP_CommentList(vo);
    	
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

    @RequestMapping(value="/getP_BestCommentList.do")
    public @ResponseBody String ajax_getP_BestCommentList(P_BestCommentDTO dto) throws JSONException {
    	List<P_BestCommentDTO> result = P_CommentService.getP_BestCommentList(dto);
    	
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
