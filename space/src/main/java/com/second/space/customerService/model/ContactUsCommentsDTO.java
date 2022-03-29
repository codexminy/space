package com.second.space.customerService.model;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ContactUsCommentsDTO {
	private Integer cuc_comment_id;
	private Integer cu_id;
	private String cuc_comment_content;
	private Integer user_id;
	private String cuc_comment_delete;
	private Date cuc_comment_date;
}
