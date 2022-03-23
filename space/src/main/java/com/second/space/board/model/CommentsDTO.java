package com.second.space.board.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class CommentsDTO {
	private Integer comments_id;
	private Integer board_id;
	private Integer comments_depth;
	private Integer comments_group_id;
	private Integer comments_group_order_id;
	private String comments_content;
	private Integer user_id;
	private String comments_delete ;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date comments_date;
	private String icon_name;
	
}
