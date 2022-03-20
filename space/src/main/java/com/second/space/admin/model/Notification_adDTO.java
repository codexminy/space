package com.second.space.admin.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Notification_adDTO {
	private int na_id;
	@JsonFormat(pattern = "yyyy/MM/dd")
	private Date na_start_date;
	@JsonFormat(pattern = "yyyy/MM/dd")
	private Date na_end_date;
	private String na_img;
	private String na_active;
	private String na_url;
	private String na_cookie;
	private String na_title;
	private String na_name;
}
