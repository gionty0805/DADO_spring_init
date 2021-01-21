package com.dado.demo.vo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;
import java.util.List;

/**
 * Created by 9111665 on 2021-01-17.
 * Description:
 */
@Data
public class BoardPostVO extends BoardVO {

    /* 게시글 관련*/
    private int post_id;
    private String title;
    private String cont;
    private String writer;
    private String writer_nm;
    @DateTimeFormat(pattern = "yyyy.MM.dd HH:mm")
    private Date regdate;

    /* 답글 관련*/
    int origin_no; //root번호 (최초조상님 트리꼭대기)
    //int parent_ord; //group_ord를 업데이트 하기 위한 parent_ord
    int parent_id;
    //int group_ord; //원글에 대한 순서
    int parent_layer; //부모의 계층
    int group_layer; //답글 계층 (원글에대한 답글인지 답글에대한 답글인지)

    /* 첨부파일 관련*/
    //MultipartFile[] files = null;
    List<FileVO> file_list;

    /* 페이징 관련*/
    PageVO pageVO = new PageVO();
}
