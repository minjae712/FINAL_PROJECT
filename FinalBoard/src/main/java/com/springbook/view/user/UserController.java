package com.springbook.view.user;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService userservice;
	Map<String, Boolean> errors = new HashMap<String, Boolean>();

	@RequestMapping(value = "/createUser.do", headers = ("content-type=multipart/*"))
	public String userCreate(UserVO vo,HttpServletRequest request) throws IOException{
	
		if (vo.getId() == null || vo.getId() == "") {
			return "createUser.jsp";
		}
        
		String imgFolder ="customcss\\"; //저장할 경로
		String realFolder = request.getRealPath("") + imgFolder; //web-inf바로전 까지 저장할 경로
		System.out.println( "설정 경로 : " + realFolder);
		MultipartFile uploadFile = vo.getFile(); //단일 파일 업로드
		String fullname = uploadFile.getOriginalFilename();
		int idx = 0;
		String filename = "";
		if(fullname.contains("\\")) {
			idx = fullname.lastIndexOf("\\");
			filename = fullname.substring(idx+1);
			if(!uploadFile.isEmpty()) {
				uploadFile.transferTo(new File(realFolder + filename));
				vo.setImage(filename);
			}
		}else {
			if(!uploadFile.isEmpty()) {
				uploadFile.transferTo(new File(realFolder + fullname));
				vo.setImage(fullname);
			
			}
		}
		userservice.createUser(vo);
		return "createUserSuccess.jsp";
	}

	@RequestMapping("/login.do")
	public String getUser(UserVO vo, HttpSession session) {

		vo.idAndPwIsNotNull(errors, vo);
		if (!errors.isEmpty()) {
			System.out.println("로그인 실패 : 아이디나 비밀번호가 비었습니다.");
			vo = null;
			errors.clear();
			return "login.jsp";
		}

		UserVO user = userservice.getUser(vo);

		if (user != null && vo.matchPassword(user)) {
			System.out.println("로그인 성공");
			errors.clear();
			session.setAttribute("user", user);
			vo = null;
			return "index.jsp";
		} else {
			System.out.println("로그인 실패 : 아이디가 없거나 비밀번호가 틀립니다.");
			vo = null;
			return "login.jsp";
		}
	}
	
	@RequestMapping("/naverLogin.do")
	public String naverLogin(HttpSession session) {
		
		return "naverLogin.jsp";
		
	}
	
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {

		session.invalidate();
		return "index.jsp";

	}

	@RequestMapping("/changePassword.do")
	public String changePassword(UserVO vo) {
		System.out.println("비밀번호 처리");
		userservice.changePassword(vo);
		return "index.jsp";

	}

	@RequestMapping("/find_id.do")
	public String find_id(UserVO vo, Model model) {
		System.out.println("아이디 찾는중");

		UserVO find_id = userservice.find_id(vo);

		if (find_id == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("find_id", find_id.getId());
		}

		return "find_id.jsp";
	}

	@RequestMapping("/findPassword.do")
	public String findPassword(UserVO vo, Model model) {
			UserVO find_pw = userservice.findPassword(vo);
			if(vo.getEmail().equals(find_pw.getEmail()) && vo.getId().equals(find_pw.getId())) {
				model.addAttribute("find",find_pw);
				return "findSuccess.jsp";
			}else {
				errors.put("email", Boolean.TRUE);
				model.addAttribute("error",errors);
				return "findPassword.jsp";
			}
		
	}
	
	@RequestMapping("userUpdate.do")
	public String userUpdate(UserVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		
		String imgFolder ="customcss\\"; //저장할 경로
		String realFolder = request.getRealPath("") + imgFolder; //web-inf바로전 까지 저장할 경로
		System.out.println( "설정 경로 : " + realFolder);
		MultipartFile uploadFile = vo.getFile(); //단일 파일 업로드
		String fullname = uploadFile.getOriginalFilename();
		int idx = 0;
		String filename = "";
		if(fullname.contains("\\")) {
			idx = fullname.lastIndexOf("\\");
			filename = fullname.substring(idx+1);
			if(!uploadFile.isEmpty()) {
				uploadFile.transferTo(new File(realFolder + filename));
				vo.setImage(filename);
			}
		}else {
			if(!uploadFile.isEmpty()) {
				uploadFile.transferTo(new File(realFolder + fullname));
				vo.setImage(fullname);
			
			}
		}
		
		userservice.userUpdate(vo);
		return "userUpdateSuccess.jsp";
	}
	
	@RequestMapping("/userDelete.do")
	public String userDelete(UserVO vo, HttpSession session, Model model) throws Exception {
		
		UserVO user = (UserVO) session.getAttribute("user");
		String sessionPass = user.getPassword();
		String voPass = vo.getPassword();
		
		if(!(sessionPass.equals(voPass))) {
			return "passwordConfirm_del.jsp";
		}
		
		userservice.userDelete(vo);
		session.invalidate();
		return "deleteUserSuccess.jsp";
	}
	
	@RequestMapping("/getUser.do")
	public String getUser() {
		return "myPage.jsp";
	}

	
}


