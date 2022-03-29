package com.second.space.admin.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Contact_usDTO {
	private int rn;
	private int cu_id;
	private int cs_category_id;
	private int user_id;
	private String cu_title;
	private String cu_content;
	private String cu_img;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cu_date;
	private String cu_state;
	private String cs_name;
	private int cuc_comment_id;
	private String cuc_comment_content;
	private String cuc_comment_delete;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cuc_comment_date;
}
