package com.springbook.biz.convidence;


import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CartVO {
	
	private int cart_code;
	private String pro_code;
	private String pro_name;
	private String mem_code;
	private int price;
	private int count;
	private Date save_date;
	private String image;
	private int pro_check;
	
}
