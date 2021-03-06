package com.test.studying.common.domain;

import lombok.Data;

@Data
public class PageDTO {
	
	private int page = 1;		 		
	private int perPageNum = 10; 		
	private int totalCount;		 		
	private int startPage; 		 		
	private int endPage;		 		
	private boolean prev;		 		
	private boolean next;				
	private int displayPageNum = 10;		
    private int tempEndPage;			
//    private String keyword;			

    public PageDTO(int page, int perPageNum) {
    	this.page = page;
		this.perPageNum = perPageNum;
    }
    
    public int getPageStart() {
    	return (this.page-1) * perPageNum;
    }
    
    public void setPage(int page) {
    	if(page<=0) {
    		this.page = 1;
    	} else {
    		this.page = page;
    	}
    }
    
    public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if(pageCount != cnt) {
			this.perPageNum = cnt;
		}
		else {
			this.perPageNum = pageCount;
		}
	}
    
    public void setTotalCount(int totalCount) {
    	this.totalCount = totalCount;
    	pageingData();
    }
    
    public void pageingData() {
    	
    	endPage = (int) (Math.ceil(this.page / (double) displayPageNum) * displayPageNum);
        startPage = (endPage - displayPageNum) + 1;
        
        int tempEndPage = (int) (Math.ceil(totalCount / (double) this.perPageNum));
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }
        
        prev = startPage == 1 ? false : true;
        next = endPage * this.perPageNum >= totalCount ? false : true;
    }
    
}
