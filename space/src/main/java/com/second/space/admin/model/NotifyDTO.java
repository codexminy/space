package com.second.space.admin.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NotifyDTO {
	private int rn;
	private int n_id;
	private int c_id;
	private int nc_id;
	private int nr_id;
	private String reported;
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date n_notify_date;
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date nc_notify_date;
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date nr_notify_date;
	private int user_id;
	private int board_id;
	private int c_board_id;
	private int review_id;
	private String reporter;
	private String nfc_name;
	private int user_reported;
	private String n_content;
	private String nc_content;
	private String nr_content;
	private String n_handling;
	private String nc_handling;
	private String nr_handling;
}
