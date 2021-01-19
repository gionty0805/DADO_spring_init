package com.dado.demo.mapper;

import com.dado.demo.vo.FileVO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 9111665 on 2021-01-17.
 * Description:
 */
@Repository("com.dado.demo.mapper.FileMapper")
public interface FileMapper {
    int insertFile(FileVO vo);

    List<FileVO> selectFileList(FileVO vo);

    int delete_file(int file_id);
}
