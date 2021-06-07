package com.springbook.biz.user;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class NaverLoginVO {
	private int no; 
	private String id;
	private String naverlogin_id;
	private String email;
	private String mobile;
	private String profile_image;
	
	@Override
	public String toString() {
		return "NaverLoginVO [no=" + no + ", id=" + id + ", naverlogin_id=" + naverlogin_id + ", email=" + email
				+ ", mobile=" + mobile + "]";
	}
}
