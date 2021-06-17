package com.springbook.biz.P_comment;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class P_BestCommentDTO {
	
	private int commentNo;
	private int no;
	private String writer;
	private Date regDate;
	private String content;
	private int good;
	private int bad;
	
}
