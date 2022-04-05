package com.second.space.mySpace.model;

import lombok.Data;

@Data
public class LikeInfoDTO {
	private int board_like_id;
	private int board_id;
	private String board_title;
	private int board_price;
	private String user_address;
	private String renamedfilename;
}
