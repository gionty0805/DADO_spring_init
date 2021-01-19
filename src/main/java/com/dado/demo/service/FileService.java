package com.dado.demo.service;

import com.dado.demo.vo.FileVO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;

/**
 * Created by 9111665 on 2021-01-17.
 * Description:
 */
public interface FileService {

    List<FileVO> file_upload(MultipartFile[] files) throws IOException;

    boolean delete_file(int file_id);
}
