package com.dado.demo.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int id;
	private String title;
	private String cont;
	private String writer;
	private Date regdate;
}
