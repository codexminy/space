package com.second.space.admin.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageSet {
	private int pageNum;
	private int amount;
	
	public PageSet() {
		this(1, 10);
	}
	
	public PageSet(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
