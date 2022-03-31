package com.second.space.user_.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@NoArgsConstructor
@Data
public class LoginIdListDTO {
	private Integer user_login_id;
	private String login_id;
	private String user_login_type; // general, kakao 
}
