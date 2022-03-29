package com.second.space.admin.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.second.space.board.model.PaymentsCategoryDTO;
import com.second.space.community.model.CommunityCategoryDTO;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class UserDTO {
	private int rn;
	private int user_id;
	private String user_phone;
	private String user_password;
	private String user_admin;
	private int user_login_id;
	private String user_nickname;
	private String user_address;
	private String user_gender;
	private String user_name;
	private String user_ban;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date user_join_date;
	private String user_profile;
	private int user_following;
	private int user_followed;
	private String user_check_email;
	private String user_public_profile;
	private String user_delete;
	private int user_reported;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date user_notify_start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date user_notify_end_date;
	private Login_id_listDTO lilDTO;
	private Delete_accountDTO daDTO;
	private PaymentsCategoryDTO pcDTO;
	private A_boardDTO abDTO;
	private A_Community_boardDTO acbDTO;
	private CommunityCategoryDTO ccDTO;
	private Notice_adminDTO naDTO;
	private Contact_usDTO cuDTO;
}
