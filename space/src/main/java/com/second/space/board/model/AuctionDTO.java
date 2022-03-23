package com.second.space.board.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class AuctionDTO {
	private Integer auction_id;
	private Integer user_id;
	private Integer board_id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date auction_start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date auction_end_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date auction_date;
	private Integer auction_price;
}
