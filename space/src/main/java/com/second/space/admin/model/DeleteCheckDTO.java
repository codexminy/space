package com.second.space.admin.model;

import lombok.Data;

@Data
public class DeleteCheckDTO {
	private String table;
	private String column;
	private int[] idArr;
	private int id;
}
