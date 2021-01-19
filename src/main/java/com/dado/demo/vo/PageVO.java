package com.dado.demo.vo;

import lombok.*;

/**
 * Created by 9111665 on 2021-01-17.
 * Description:
 */
@Data
public class PageVO {
    int page_no = 1;
    int display_start;
    int display_rows = 10;//한 페이지당 보여줄

    public int getDisplay_start(){
        return display_start = ((this.page_no -1) * this.display_rows);
    }
}
