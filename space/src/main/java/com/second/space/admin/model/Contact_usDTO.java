package com.second.space.admin.model;

import java.util.Date;

import lombok.Data;

@Data
public class Contact_usDTO {
	private int cu_id;
	private int cs_category_id;
	private int user_id;
	private String cu_title;
	private String cu_content;
	private String cu_img;
	private Date cu_date;
	private String cu_state;
	private Cs_categoryDTO cscDTO;
}
