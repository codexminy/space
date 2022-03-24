package com.second.space.admin.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BoardNotifyDTO {
	private String login_id_1;
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date n_notify_date;
	private int user_id;
	private int board_id;
	private int c_board_id;
	private String login_id_2;
	private String nfc_name;
	private int user_reported;
}
