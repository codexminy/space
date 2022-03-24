package com.second.space.admin.model;

import lombok.Data;

@Data
public class PageSet {
	private int pageNum;
	private int amount;
	private String keyword;
	private String type;
	private String[] typeArr;
	
	public PageSet() {
		this(1, 10);
	}
	
	public PageSet(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}
}
