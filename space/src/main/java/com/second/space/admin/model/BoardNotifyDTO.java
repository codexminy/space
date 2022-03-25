package com.second.space.admin.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BoardNotifyDTO {
	private int n_id;
	private String reported;
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date n_notify_date;
	private int user_id;
	private int board_id;
	private int c_board_id;
	private String reporter;
	private String nfc_name;
	private int user_reported;
	private String n_content;
	private String n_handling;
}
