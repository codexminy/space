package com.second.space.board.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class WinningBidDTO {
	private Integer winning_bid;
	private Integer auction_id;
	private Integer winning_price;
	private Integer board_id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date winning_date;
	private Integer user_id;
	private String win_status;
}
