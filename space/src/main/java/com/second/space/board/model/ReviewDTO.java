package com.second.space.board.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ReviewDTO {
	private Integer review_id;
	private Integer board_id;
	private float stars;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date review_date;
	private String review_content;
	private Integer user_id;
	private String review_img;
}
