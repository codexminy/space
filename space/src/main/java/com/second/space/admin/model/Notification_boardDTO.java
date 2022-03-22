package com.second.space.admin.model;

import java.util.Date;

import lombok.Data;

@Data
public class Notification_boardDTO {
	private int n_id;
	private int board_id;
	private int c_board_id;
	private String n_handling;
	private int user_id;
	private Date notify_date;
	private int nfc_id;
	private String n_content;
}

