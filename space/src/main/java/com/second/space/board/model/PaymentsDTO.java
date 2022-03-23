package com.second.space.board.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class PaymentsDTO {
	private Integer payments_id;
	private Integer board_id;
	private Integer user_id;
	private String payments_state;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date payments_date;
}
