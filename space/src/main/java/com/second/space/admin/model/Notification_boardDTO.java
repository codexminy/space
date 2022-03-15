package com.second.space.admin.model;

import lombok.Data;

@Data
public class Notification_boardDTO {
	private int n_id;
	private int board_id;
	private int c_board_id;
	private String n_handling;
	private int user_id;
}
