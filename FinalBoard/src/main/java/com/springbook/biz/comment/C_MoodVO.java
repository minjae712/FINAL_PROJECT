package com.springbook.biz.comment;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class C_MoodVO {

	private int no;
	private int commentNo;
	private int good;
	private int bad;
	
	public void clear() {
		commentNo = 0;
		good = 0;
		bad = 0;
	}
}
