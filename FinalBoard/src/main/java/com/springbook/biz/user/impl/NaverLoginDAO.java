package com.springbook.biz.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.user.NaverLoginVO;
import com.springbook.biz.user.UserVO;

@Repository
public class NaverLoginDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void createNaverUser(NaverLoginVO vo) {
		mybatis.insert("naverDAO.createNaverUser",vo);
	}

	public NaverLoginVO getNaverLoginUser(NaverLoginVO vo) {
		return mybatis.selectOne("naverDAO.getNaverLoginUser", vo);
	}

	public UserVO findUserforNaverID(NaverLoginVO vo) {
		return mybatis.selectOne("naverDAO.findUserforNaverID",vo);
	}

	public void deleteNaverUser(NaverLoginVO vo) {
		mybatis.delete("naverDAO.deleteNaverUser",vo);
	}
}