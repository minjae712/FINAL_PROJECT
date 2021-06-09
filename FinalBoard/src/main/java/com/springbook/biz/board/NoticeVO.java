package com.springbook.biz.board;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class NoticeVO {

	private int uni;
	private String no;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
	private int cnt;
	private String SearchCondition;
	private String SearchKeyword;
	private int startRow;
	private int endRow;
	
	@Override
	public String toString() {
		return "NoticeVO [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content + ", regDate="
				+ regDate + ", cnt=" + cnt + "]";
	}
	
	public void searchNullCheck(NoticeVO vo) {
		if(vo.getSearchCondition() == null || vo.getSearchCondition().equals("")) {
			vo.setSearchCondition("TITLE");
		}
		if(vo.getSearchKeyword() == null || vo.getSearchKeyword().equals("")) {
			vo.setSearchKeyword("");
		}
	}
	
}