package com.second.space.community.model;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class CommunityCommentDTO {
	private Integer c_id;
	private Integer c_board_id;
	private Integer c_depth;
	private Integer c_group_id;
	private Integer c_group_order_id;
	private String c_content;
	private Integer user_id;
	private String c_delete;
	private Date c_date;
	private String c_icon_name;
	private String user_nickname;
}
