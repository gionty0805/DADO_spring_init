package com.dado.demo.vo;

import java.sql.Date;
import java.text.Format;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class BoardVO {
	private int board_id; //게시판아이디
	private String board_name; //게시판명
	private Date regdate; //게시판등록일
	private String board_url;
	private String creater;
}
