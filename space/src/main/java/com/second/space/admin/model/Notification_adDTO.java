package com.second.space.admin.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class Notification_adDTO {
	private int rn;
	private int na_id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date na_start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date na_end_date;
	private String na_img;
	private String na_active;
	private String na_url;
	private String na_cookie;
	private String na_title;
	private String na_name;
	@JsonIgnore
	private MultipartFile uploadFile;
}
