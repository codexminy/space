package com.second.space.customerService.model;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ContactUsDTO {
	private Integer cu_id;
	private Integer cs_category_id;
	private Integer user_id;
	private String cu_title;
	private String cu_content;
	private String cu_img;
	private Date cu_date;
	private String cu_state;
}
