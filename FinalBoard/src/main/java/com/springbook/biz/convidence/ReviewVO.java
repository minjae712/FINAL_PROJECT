package com.springbook.biz.convidence;


import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReviewVO {
	
	private int review_code;
	private String pro_code;
	private String pro_name;
	private String mem_code;
	private int price;
	private Date review_date;
	private String name;
	private String content;
	private int sell_code;
	
}
