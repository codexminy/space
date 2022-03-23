package com.second.space.community.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class CommunityCommentCountDTO {
	private Integer c_board_id;
	private Integer total;
}
