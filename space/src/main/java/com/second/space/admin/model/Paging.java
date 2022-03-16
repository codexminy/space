package com.second.space.admin.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Paging {
	private int startPage;
	private int endPage;
	private int trueEnd;
	private int total;
	private boolean prev;
	private boolean next;
	private PageSet ps;
	
	public Paging(int total, PageSet ps) {
		this.total = total;
		this.ps = ps;
        this.endPage = (int)(Math.ceil(ps.getPageNum()/10.0))*10;
        this.startPage = this.endPage - 9;
        this.trueEnd = (int)(Math.ceil(total * 1.0/ps.getAmount()));

        if(trueEnd < this.endPage) {
            this.endPage = trueEnd;
        }

        this.prev = this.startPage > 1;
        this.next = this.endPage < trueEnd;
	}
}
