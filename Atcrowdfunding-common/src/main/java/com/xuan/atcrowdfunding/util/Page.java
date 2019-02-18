package com.xuan.atcrowdfunding.util;

import java.util.List;

public class Page {
	
	private Integer pageno;
	private Integer pageSize;
	private List datas;
	private Integer totalSize;  //总页数
	private Integer totalno;   //总记录数
	
	public Page(Integer pageno, Integer pageSize) {
		if(pageno <= 0) {
			this.pageno = 1;
		}else {
			this.pageno = pageno;
		}
		
		if(pageSize <= 0) {
			this.pageSize = 10;
		}else {
			this.pageSize = pageSize;
		}
		
	}
	
	public Integer getPageno() {
		return pageno;
	}
	public void setPageno(Integer pageno) {
		this.pageno = pageno;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public List getDatas() {
		return datas;
	}
	public void setDatas(List datas) {
		this.datas = datas;
	}
	public Integer getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(Integer totalSize) {
		this.totalSize = totalSize;
		totalno = (totalSize%pageSize)==0?(totalSize/pageSize):(totalSize/pageSize+1);
	}
	public Integer getTotalno() {
		return totalno;
	}
	private void setTotalno(Integer totalno) {
		this.totalno = totalno;
	}
	
	public Integer getStartIndex() {
		return (this.pageno-1)*pageSize;
	}
	
}
