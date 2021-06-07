package com.springbook.biz.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.user.NaverLoginService;
import com.springbook.biz.user.NaverLoginVO;
import com.springbook.biz.user.UserVO;

@Service
public class NaverLoginServiceImpl implements NaverLoginService{
	
	@Autowired
	private NaverLoginDAO naverLoginDAO;
	
	public void createNaverUser(NaverLoginVO vo) {
		naverLoginDAO.createNaverUser(vo);
	}

	public NaverLoginVO getNaverLoginUser(NaverLoginVO vo) {
		return naverLoginDAO.getNaverLoginUser(vo);
	}

	public UserVO findUserforNaverID(NaverLoginVO vo) {
		return naverLoginDAO.findUserforNaverID(vo);
	}

	public void deleteNaverUser(NaverLoginVO vo) {
		naverLoginDAO.deleteNaverUser(vo);
	}
	
	
}
