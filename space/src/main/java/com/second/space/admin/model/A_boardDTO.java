package com.second.space.admin.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class A_boardDTO {
	private int board_id;
	private String board_title;
	private int p_category_id;
	private String board_content;
	private String board_price;
	private String board_trade_type;
	private int user_id;
	private int board_view;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date board_date;
	private String board_delete;
	private String board_state;
	private String auction_state;
	private String board_hidden;
}
