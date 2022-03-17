package com.second.space.community.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class CommunityBoardDTO {
	private Integer c_board_id;
	private String c_board_title;
	private Integer c_category_id;
	private Integer user_id;
	private String c_category_name;
	private String c_board_content;
	private String c_board_img;
	private Integer c_board_view;
	private String c_board_delete;
	private String user_nickname;
	
	@DateTimeFormat(pattern = "yy-MM-dd")
	private Date c_board_date;
}
