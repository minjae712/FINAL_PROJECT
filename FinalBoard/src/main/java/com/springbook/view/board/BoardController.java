package com.springbook.view.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springbook.biz.board.B_MoodVO;
import com.springbook.biz.board.BoardPages;
import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.NoticeVO;
import com.springbook.biz.comment.CommentService;
import com.springbook.biz.comment.CommentVO;

@Controller
@SessionAttributes("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping("/b_goodOrBad.do")
	public @ResponseBody String ajax_b_goodOrBad(B_MoodVO vo) throws IOException {
		boardService.goodOrBad(vo);
		vo.clear();
		return "success";
	}
	
	@RequestMapping(value = "/insertBoard.do")
	public String insertBoard(BoardVO vo) throws IOException {
		boardService.insertBoard(vo);
		return "redirect:getBoardList.do";
	}
	

	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo) {
		boardService.updateBoard(vo);
		return "redirect:getBoardList.do";
	}

	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		boardService.deleteBoard(vo);
		return "redirect:getBoardList.do";
	}

	@RequestMapping("/deleteNotice.do")
	public String deleteNotice(NoticeVO nvo) {
		boardService.deleteNotice(nvo);
		return "redirect:getBoardList.do";
	}

	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		BoardVO result = boardService.getBoard(vo);
		model.addAttribute("board", result);
		return "getBoard.jsp"; 
	}

	@RequestMapping("/getBoardMood.do")
	public @ResponseBody String ajax_getBoardMood(B_MoodVO vo) {
		B_MoodVO result = boardService.getMood(vo);
		JSONArray jsonArr = new JSONArray();
		JSONObject json = new JSONObject();
		
		json.put("no", result.getNo());
		json.put("good", result.getGood());
		json.put("bad", result.getBad());
		
		jsonArr.put(json);
		
		return jsonArr.toString(); 
	}
	
	@RequestMapping("/getNotice.do")
	public String getNotice(NoticeVO nvo, Model model) {
		NoticeVO result = boardService.getNotice(nvo);
		model.addAttribute("nvo", result);
		return "getNotice.jsp"; 
	}


	@RequestMapping(value ="/getBoardList.do")
	public String getBoardList(@ModelAttribute("bvo")BoardVO vo,BoardPages pages,Model model) {
		
		int pageNo = 1;
		if(pages.getCurrentPage() == 0) {
			pages.setCurrentPage(pageNo);
		}
		vo.searchNullCheck(vo);
		BoardPages result = boardService.getBoardPages(pages.getCurrentPage(),vo);
		vo.setSearchKeyword(vo.getSearchKeyword());
		model.addAttribute("noticeList",boardService.getNoticeList());
		model.addAttribute("pages",result);
		return "blog.jsp";
	}
	
	@RequestMapping(value = "/insertNotice.do")
	public String insertNotice(NoticeVO vo) throws IOException {
		boardService.insertNotice(vo);
		return "redirect:getBoardList.do";
	}
	
	@RequestMapping(value ="/getBestList.do")
	public @ResponseBody String getBestList(BoardVO vo) throws JSONException {
		List<BoardVO> result = boardService.getBestList(vo);
		
		JSONArray jsonArray = new JSONArray();
		
		for (int i = 0; i < result.size(); i++) {
			JSONObject json = new JSONObject();
			
			json.put("no", result.get(i).getNo());
			json.put("writer", result.get(i).getWriter());
			json.put("title", result.get(i).getTitle());
			json.put("content", result.get(i).getContent());
			json.put("regDate", result.get(i).getRegDate());
			json.put("cnt", result.get(i).getCnt());
			
			jsonArray.put(json);
		}
		return jsonArray.toString();
	}



}
