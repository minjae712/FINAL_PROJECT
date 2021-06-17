package com.springbook.biz.PetStory;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;


@Getter @Setter
public class PetStoryVO {

	
	private MultipartFile uploadFile;
	private String fileName;
	private int no;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
	private int cnt;
	private int comment_cnt;
	private String searchCondition;
	private String searchKeyword;
	private int startRow;
	private int endRow;
	private String name;
	
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content + ", regDate="
				+ regDate + ", cnt=" + cnt + "]";
	}

	public Boolean isEmpty() {
		return (this.searchKeyword != null) || (!this.searchKeyword.equals(""));
	}
	
	public void searchNullCheck(PetStoryVO vo) {
		if(vo.getSearchCondition() == null || vo.getSearchCondition().equals("")) {
			vo.setSearchCondition("TITLE");
		}
		if(vo.getSearchKeyword() == null || vo.getSearchKeyword().equals("")) {
			vo.setSearchKeyword("");
		}
	}
		
}