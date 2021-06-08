package com.springbook.view.user;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springbook.biz.user.NaverLoginService;
import com.springbook.biz.user.NaverLoginVO;
import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService userservice;
	@Autowired
	private NaverLoginService naverLoginService;
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
	public String naverLogin(HttpSession session,@RequestParam String access_token,
			@RequestParam String refresh_token, NaverLoginVO naver_vo, UserVO vo) {
		    String token = access_token;
			String header = "Bearer " + token;
		 if(access_token != null) { // access_token을 잘 받아왔다면
	        	try {
	        		
	        		String apiurl = "https://openapi.naver.com/v1/nid/me";
	        		 URL url = new URL(apiurl);
	        		HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        		con.setRequestMethod("GET");
	        		con.setRequestProperty("Authorization", header);
	        		int responseCode = con.getResponseCode();
	        		BufferedReader br;
	        		if(responseCode==200) { // 정상 호출
	        		 br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	        		} else {  // 에러 발생
	        		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	        		}
	        		String inputLine;
	        		StringBuffer res = new StringBuffer();
	        		 while ((inputLine = br.readLine()) != null) {
	        		res.append(inputLine);
	        		}
	        		br.close();
	        		JSONParser parsing = new JSONParser();
	        		Object obj = parsing.parse(res.toString());
	        		JSONObject jsonObj = (JSONObject)obj;
	        		JSONObject resObj = (JSONObject)jsonObj.get("response");
	        		 
	        		String naverCode = (String)resObj.get("id");
	        		String email = (String)resObj.get("email");
	        		String mobile = (String)resObj.get("mobile");
	        		String profile_image = (String)resObj.get("profile_image");
	        		
	        		naver_vo.setNaverlogin_id(naverCode);
	        		naver_vo.setEmail(email);
	        		naver_vo.setMobile(mobile);
	        		naver_vo.setProfile_image(profile_image);
	        		
	        		System.out.println(naverCode);
	        		System.out.println(email);
	        		System.out.println(mobile);
	        		System.out.println(profile_image);
	        		
	        		session.setAttribute("naverLogin", naver_vo);
	        		
	        		vo = (UserVO)session.getAttribute("user");
	        		if(vo != null) {
	        			naver_vo.setId(vo.getId());
	        			naverLoginService.createNaverUser(naver_vo);
	        			return "getUser.do";
	        		}
	        		
	        		naver_vo = naverLoginService.getNaverLoginUser(naver_vo);
	        		if(naver_vo != null) {
	        			vo = naverLoginService.findUserforNaverID(naver_vo);
	        			session.setAttribute("user", vo);
	        			return "index.jsp";
	        		}
	        		
	        		
	        		} catch (Exception e) {
	        		System.out.println(e);
	            }
	        }
		
		return "interlock.jsp";
		
	}
	
	@RequestMapping("/naverinterlock.do")
	public String naverinterlock(HttpSession session, UserVO vo) {
		NaverLoginVO naver_vo = (NaverLoginVO) session.getAttribute("naverLogin");
		
		if(naver_vo != null) {
			UserVO user = userservice.getUser(vo);
			vo.idAndPwIsNotNull(errors, vo);
			if (!errors.isEmpty()) {
				System.out.println("로그인 실패 : 아이디나 비밀번호가 비었습니다.");
				vo = null;
				errors.clear();
				return "interlock.jsp";
			}
			
			if (user != null && vo.matchPassword(user)) {
				System.out.println("로그인 성공");
				errors.clear();
				naver_vo.setId(vo.getId());
    			naverLoginService.createNaverUser(naver_vo);
				session.setAttribute("user", user);
				vo = null;
				return "index.jsp";
			} else {
				System.out.println("로그인 실패 : 아이디가 없거나 비밀번호가 틀립니다.");
				vo = null;
				return "interlock.jsp";
			}
		}
		return "interlock.jsp";
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


