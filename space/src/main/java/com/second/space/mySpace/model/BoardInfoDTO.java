package com.second.space.mySpace.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BoardInfoDTO {
	private int board_id;
	private String board_title;
	private int board_price;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date board_date;
	private String board_delete;
	private String board_state;
	private String board_hidden;
	private String originalfilename;
	private String renamedfilename;
	private String user_address;
}
