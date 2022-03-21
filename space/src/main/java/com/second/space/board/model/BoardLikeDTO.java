package com.second.space.board.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class BoardLikeDTO {
	private Integer board_like;
	private Integer board_id;
	private Integer user_id;
}
