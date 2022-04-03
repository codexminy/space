package com.second.space.user_.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MainInfoDTO {
	private int board_id;
	private String originalfilename;
	private String renamedfilename;
	private String board_title;
	private String board_price;
	private String user_address;
	private Integer user_id;
}
