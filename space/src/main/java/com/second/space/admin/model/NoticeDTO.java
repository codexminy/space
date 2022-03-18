package com.second.space.admin.model;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class NoticeDTO {
	private int notice_id;
	private String notice_title;
	private String notice_content;
	private int user_id;
	private Date notice_date;
	private String notice_img;
	private String notice_delete;
	private int notice_view;
	@JsonIgnore
	private List<MultipartFile> uploadFile;
}
