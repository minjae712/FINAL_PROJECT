package com.springbook.biz.comment;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class BestCommentDTO {
	
	private int commentNo;
	private int no;
	private String writer;
	private Date regDate;
	private String content;
	private int good;
	private int bad;
	
}
