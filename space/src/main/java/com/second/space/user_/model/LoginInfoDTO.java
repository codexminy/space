package com.second.space.user_.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Data
public class LoginInfoDTO {
	private String login_id;
	private String user_password;
	private String autoLogin;
}
