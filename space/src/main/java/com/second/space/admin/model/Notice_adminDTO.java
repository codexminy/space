package com.second.space.admin.model;

import java.util.Date;

import lombok.Data;

@Data
public class Notice_adminDTO {
	private int notice_admin_id;
	private String notice_admin_title;
	private String notice_admin_content;
	private int user_id;
	private Date notice_admin_date;
	private String notice_admin_img;
	private int notice_admin_view;
}
