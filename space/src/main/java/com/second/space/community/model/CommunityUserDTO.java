package com.second.space.community.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class CommunityUserDTO {
	private Integer user_id;
	private String user_login_id;
	private String user_nickname;
	private String user_gender;
	private String user_name;
	private String user_profile;
	private String user_ban;
}
