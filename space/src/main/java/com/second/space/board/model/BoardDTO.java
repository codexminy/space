package com.second.space.board.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@NoArgsConstructor
@Data
public class BoardDTO {
	private Integer board_id;
	private String board_title;
	private Integer p_category_id;
	private String board_content;
	private String board_price;
//	private String board_img;
	private String board_trade_type;
	private Integer user_id;
//	private Integer board_like;
	private Integer board_view;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date board_date;
	private String board_delete ;
	private String board_state;
	private String auction_state;

}
