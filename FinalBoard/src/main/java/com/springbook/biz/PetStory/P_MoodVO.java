package com.springbook.biz.PetStory;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class P_MoodVO {

	private int no;
	private int good;
	private int bad;
	
	public void clear() {
		no = 0;
		good = 0;
		bad = 0;
	}
}
