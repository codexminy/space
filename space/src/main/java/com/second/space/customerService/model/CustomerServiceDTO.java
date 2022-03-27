package com.second.space.customerService.model;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class CustomerServiceDTO {
	private Integer cs_id;
	private String cs_title;
	private Integer cs_category_id;
	private String cs_content;
	private String cs_img;
	private Integer user_id;
	private Integer cs_view;
	private Date cs_date;
	private String cs_delete;
}
