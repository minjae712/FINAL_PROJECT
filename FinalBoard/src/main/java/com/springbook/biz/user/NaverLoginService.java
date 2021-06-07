package com.springbook.biz.user;

public interface NaverLoginService {

	public void createNaverUser(NaverLoginVO vo);

	public NaverLoginVO getNaverLoginUser(NaverLoginVO vo);

	public UserVO findUserforNaverID(NaverLoginVO vo);
	
	public void deleteNaverUser(NaverLoginVO vo);
}
