package com.second.space.admin.model;

import java.util.Date;

import lombok.Data;

@Data
public class A_Community_boardDTO {
	private int c_board_id;
	private String c_board_title;
	private int c_category_id;
	private String c_board_content;
	private String c_board_img;
	private int user_id;
	private int c_board_view;
	private Date c_board_date;
	private String c_board_delete;
	private String c_board_hidden;
}
