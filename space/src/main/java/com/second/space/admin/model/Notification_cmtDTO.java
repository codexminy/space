package com.second.space.admin.model;

import java.util.Date;

import lombok.Data;

@Data
public class Notification_cmtDTO {
	private int nc_id;
	private int board_id;
	private int c_board_id;
	private String nc_handling;
	private int comment_id;
	private int c_id;
	private int user_id;
	private Date nc_notify_date;
}
