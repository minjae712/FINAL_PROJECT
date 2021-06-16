package com.springbook.view.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.springbook.biz.board.B_HistoryDTO;
import com.springbook.biz.board.B_MoodVO;
import com.springbook.biz.board.BoardPages;
import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.NoticeVO;

@Controller
@SessionAttributes("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping("/b_goodOrBad.do")
	public @ResponseBody String ajax_b_goodOrBad(B_MoodVO vo,B_HistoryDTO dto) throws Exception {
		System.out.println("진입성공");
		boardService.goodOrBad(vo,dto);
		vo.clear();
		return "success";
	}
	
	@RequestMapping(value = "/insertBoard.do")
	public String insertBoard(BoardVO vo,HttpServletRequest request) throws IOException {
		
		vo.setFileName("");
		String upload ="uploadfile\\"; //저장할 경로
		String realFolder = request.getRealPath("") + upload; //web-inf바로전 까지 저장할 경로
		System.out.println( "설정 경로 : " + realFolder);
		MultipartFile uploadFile = vo.getUploadFile();
		String fullname = uploadFile.getOriginalFilename();
		int idx = 0;
		String filename = "";
		if(fullname.contains("\\")) {
			idx = fullname.lastIndexOf("\\");
			filename = fullname.substring(idx+1);
			if(!uploadFile.isEmpty()) {
				uploadFile.transferTo(new File(realFolder + filename));
				vo.setFileName(filename);
			}
		}else {
			if(!uploadFile.isEmpty()) {
				uploadFile.transferTo(new File(realFolder + fullname));
				vo.setFileName(fullname);
			
			}
		}	
		boardService.insertBoard(vo);
		return "redirect:InsertBoardSuccess.jsp";
	}
	

	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo) {
		boardService.updateBoard(vo);
		return "updateBoardSuccess.jsp";
	}

	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		boardService.deleteBoard(vo);
		return "deleteBoardSuccess.jsp";
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
	public String getNotice(NoticeVO nvo,@ModelAttribute("back") Integer back, Model model) {
		NoticeVO result = boardService.getNotice(nvo);
		model.addAttribute("nvo", result);
		return "getNotice.jsp"; 
	}


	@RequestMapping(value ="/getBoardList.do")
	public String getBoardList(@ModelAttribute("bvo")BoardVO vo,BoardPages<BoardVO> pages,Model model) {
		
		int pageNo = 1;
		if(pages.getCurrentPage() == 0) {
			pages.setCurrentPage(pageNo);
		}
		vo.searchNullCheck(vo);
		BoardPages<BoardVO> result = boardService.getBoardPages(pages.getCurrentPage(),vo);
		vo.setSearchKeyword(vo.getSearchKeyword());
		model.addAttribute("noticeList",boardService.getNoticeList());
		model.addAttribute("pages",result);
		return "getBoardList.jsp";
	}
	
	@RequestMapping(value ="/getBoardUserList.do")
	public String getBoardUserList(@ModelAttribute("bvo")BoardVO vo,BoardPages<BoardVO> pages,Model model,@RequestParam String name) {
		
		int pageNo = 1;
		if(pages.getCurrentPage() == 0) {
			pages.setCurrentPage(pageNo);
		}
		vo.searchNullCheck(vo);
		BoardPages<BoardVO> result = boardService.getBoardUserPages(pageNo, vo, name);
		vo.setSearchKeyword(vo.getSearchKeyword());
		model.addAttribute("noticeList",boardService.getNoticeList());
		model.addAttribute("pages",result);
		return "getBoardUserPage.jsp";
	}
	
	@RequestMapping(value ="/getNoticeList.do")
	public String getNoticeList(NoticeVO nvo,BoardPages<NoticeVO> pages,Model model) {
		
		int pageNo = 1;
		if(pages.getCurrentPage() == 0) {
			pages.setCurrentPage(pageNo);
		}
		nvo.searchNullCheck(nvo);
		BoardPages<NoticeVO> result = boardService.getNoticePages(pages.getCurrentPage(),nvo);
		nvo.setSearchKeyword(nvo.getSearchKeyword());
		model.addAttribute("pages",result);
		return "getNoticeList.jsp";
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
