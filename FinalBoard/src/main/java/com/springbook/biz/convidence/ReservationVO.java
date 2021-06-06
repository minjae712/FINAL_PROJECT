package com.springbook.biz.convidence;



import java.sql.Date;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReservationVO {
	
	private int no;
	private String kind;
	private String user_id;
	private String user_name;
	private Date reser_date;
	private String title;
	private String content;
	private String content_else;
	
	
}