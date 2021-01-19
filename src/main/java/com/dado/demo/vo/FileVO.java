package com.dado.demo.vo;

import lombok.*;

import java.io.File;

/**
 * Created by 9111665 on 2021-01-16.
 * Description:
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FileVO {

    private int board_id;
    private int post_id;
    private int file_id;
    private String file_name_uuid;
    private String file_name_org;
    private String upload_path;
    private String extension; //확장명
    private long file_size;


}
