package com.springbook.view.petstory;

import java.io.File;
import java.io.IOException;
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

import com.springbook.biz.PetStory.P_HistoryDTO;
import com.springbook.biz.PetStory.P_MoodVO;
import com.springbook.biz.PetStory.PetStoryPages;
import com.springbook.biz.PetStory.PetStoryVO;
import com.springbook.biz.PetStory.petStoryService;

@Controller
@SessionAttributes("petstory")
public class PetStoryController {
	
	@Autowired
	private petStoryService petStoryService;
	
	
	@RequestMapping("/P_goodOrBad.do")
	public @ResponseBody String ajax_P_goodOrBad(P_MoodVO vo,P_HistoryDTO dto) throws Exception {
		System.out.println("진입성공");
		petStoryService.goodOrBad(vo,dto);
		vo.clear();
		return "success";
	}
	
	@RequestMapping(value = "/insertPetStory.do")
	public String insertPetStory(PetStoryVO vo,HttpServletRequest request) throws IOException {
		
		vo.setFileName("");
		String upload ="customcss\\"; //저장할 경로
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
		petStoryService.insertPetStory(vo);
		return "redirect:InsertPetStorySuccess.jsp";
	}
	

	@RequestMapping("/updatePetStory.do")
	public String updatePetStory(@ModelAttribute("PetStory") PetStoryVO vo) {
		petStoryService.updatePetStory(vo);
		return "updatePetStorySuccess.jsp";
	}

	@RequestMapping("/deletePetStory.do")
	public String deletePetStory(PetStoryVO vo) {
		petStoryService.deletePetStory(vo);
		return "deletePetStorySuccess.jsp";
	}

	@RequestMapping("/getPetStory.do")
	public String getPetStory(PetStoryVO vo, Model model) {
		PetStoryVO result = petStoryService.getPetStory(vo);
		model.addAttribute("PetStory", result);
		return "getPetStory.jsp"; 
	}

	@RequestMapping("/getPetStoryMood.do")
	public @ResponseBody String ajax_getBoardMood(P_MoodVO vo) {
		P_MoodVO result = petStoryService.getMood(vo);
		JSONArray jsonArr = new JSONArray();
		JSONObject json = new JSONObject();
		
		json.put("no", result.getNo());
		json.put("good", result.getGood());
		json.put("bad", result.getBad());
		
		jsonArr.put(json);
		
		return jsonArr.toString(); 
	}

	@RequestMapping(value ="/getPetStoryList.do")
	public String getBoardList(@ModelAttribute("pvo")PetStoryVO vo,PetStoryPages<PetStoryVO> pages,Model model) {
		
		int pageNo = 1;
		if(pages.getCurrentPage() == 0) {
			pages.setCurrentPage(pageNo);
		}
		vo.searchNullCheck(vo);
		PetStoryPages<PetStoryVO> result = petStoryService.getPetStoryPages(pages.getCurrentPage(),vo);
		vo.setSearchKeyword(vo.getSearchKeyword());
		model.addAttribute("petstorys",result);
		return "getPetStoryList.jsp";
	}
	
	@RequestMapping(value ="/getPetStoryUserList.do")
	public String getBoardUserList(@ModelAttribute("pvo")PetStoryVO vo,PetStoryPages<PetStoryVO> pages,Model model,@RequestParam String name) {
		
		int pageNo = 1;
		if(pages.getCurrentPage() == 0) {
			pages.setCurrentPage(pageNo);
		}
		vo.searchNullCheck(vo);
		PetStoryPages<PetStoryVO> result = petStoryService.getPetStoryUserPages(pageNo, vo, name);
		vo.setSearchKeyword(vo.getSearchKeyword());
		model.addAttribute("petstorys",result);
		return "getBoardUserPage.jsp";
	}
	
	@RequestMapping(value ="/getP_BestList.do")
	public @ResponseBody String getBestList(PetStoryVO vo) throws JSONException {
		List<PetStoryVO> result = petStoryService.getBestList(vo);
		
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
