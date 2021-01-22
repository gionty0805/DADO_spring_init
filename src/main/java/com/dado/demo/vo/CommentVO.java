package com.dado.demo.vo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;
import java.util.List;

/**
 * Created by 9111713 on 2021-01-20.
 * Description:
 */
@Data
public class CommentVO extends BoardVO {

    /* 게시글 관련*/
    private int comment_id;
    private String target_group;
    private int target_id;
    private int target_layer;
    private String cont;
    private String writer;
    private String writer_nm;
    @DateTimeFormat(pattern = "yyyy.MM.dd HH:mm")
    private Date regdate;
    @DateTimeFormat(pattern = "yyyy.MM.dd HH:mm")
    private Date deldate;
    private int post_id;
    private int origin_no;
    private int comment_cnt;
    private int parent_id;
    /* 첨부파일 관련*/
    // 무시 ..
}
