package com.second.space.admin.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Delete_accountDTO {
	private int delete_id;
	private int user_id;
	private String delete_reason;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date delete_date;
}
