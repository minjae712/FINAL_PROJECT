package com.springbook.biz.convidence;


import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class BillVO {
	
	private String sell_code;
	private String pro_code;
	private String pro_name;
	private String mem_code;
	private int price;
	private int count;
	private Date sell_date;
	private String address;
	private String phone;
	private String name;
	private String req;
	
}
