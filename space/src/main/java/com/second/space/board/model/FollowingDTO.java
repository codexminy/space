package com.second.space.board.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@NoArgsConstructor
@Data
public class FollowingDTO {
	private Integer following_id;
	private Integer user_id;
	private Integer user_login_id;
}
