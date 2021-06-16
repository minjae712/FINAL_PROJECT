package com.springbook.biz.convidence;


import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProductVO {
	
	private String pro_code;
	private String image;
	private String image_detail;
	private String name;
	private int price;
	private Date reg_date;
	private String content;
	
}
