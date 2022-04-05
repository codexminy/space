package com.second.space.mySpace.model;

import lombok.Data;

@Data
public class FollowInfoDTO {
	private int following_id;
	private String user_nickname;
	private int user_id;
	private int user_login_id;
	private String user_profile;
	private int cnt;
}
