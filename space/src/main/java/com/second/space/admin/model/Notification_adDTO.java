package com.second.space.admin.model;

import java.util.Date;

import lombok.Data;

@Data
public class Notification_adDTO {
	private int na_id;
	private Date na_start_date;
	private Date na_end_date;
	private String na_img;
	private String na_active;
	private String na_url;
	private String na_cookie;
	private String na_title;
	private String na_name;
}
