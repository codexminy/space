package com.second.space.board.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class BoardImgDTO {
	private Integer board_img_id;
	private Integer board_id;
	private String originalfilename;
	private String renamedfilename;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date upload_date;
	private String main_img;
	private String status; //삭제여부
}
