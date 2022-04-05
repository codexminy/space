package com.second.space.mySpace.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReviewInfoDTO {
	private int board_id;
	private String user_nickname;
	private String user_profile;
	private int stars;
	private String review_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date review_date;
}
