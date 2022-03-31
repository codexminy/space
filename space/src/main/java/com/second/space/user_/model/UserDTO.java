package com.second.space.user_.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@NoArgsConstructor
@Data
public class UserDTO {
	private Integer user_id;
	private String user_phone;
	private String user_password;
	private String user_admin;
	private Integer user_login_id;
	private String user_nickname;
	private String user_address;
	private String user_gender;
	private String user_name;
	private String user_ban;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date user_join_date;
	private String user_profile;
	private Integer user_following;
	private Integer user_followed;
	private String user_public_profile;
	private String user_delete;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date user_birth;
	private String originalfilename;
	private String renamedfilename;
	private String user_check_email;
	private Integer user_reported;
	private String user_email;
	private String sessionkey;
	private Date sessionlimit;
}
