package com.dado.demo.vo;

import lombok.Getter;
import lombok.ToString;

/**
 * Created by 9111665 on 2021-01-17.
 * Description:
 */
@Getter
@ToString
public class PageDTO {
    private int startPage;
    private int endPage;
    private boolean prev, next;

    private int total;
    private PageVO pageVO;

    public PageDTO(PageVO pageVO, int total) {

        this.pageVO = pageVO;
        this.total = total;

        this.endPage = (int) (Math.ceil(pageVO.getPage_no() / 10.0)) * 10;

        this.startPage = this.endPage - 9;

        int realEnd = (int) (Math.ceil((total * 1.0) / pageVO.getDisplay_rows()));

        if (realEnd <= this.endPage) {
            this.endPage = realEnd;
        }

        this.prev = this.startPage > 1;

        this.next = this.endPage < realEnd;
    }
}
