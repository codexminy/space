package com.second.space.community.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class CommunityBoardImgDTO {
	private Integer c_board_img_id;
	private Integer c_board_id;
	private String c_originalfilename;
	private String c_renamedfilename;
	private Date c_upload_date;
}
