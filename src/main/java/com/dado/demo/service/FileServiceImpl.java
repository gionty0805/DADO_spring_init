package com.dado.demo.service;

import com.dado.demo.mapper.FileMapper;
import com.dado.demo.vo.FileVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

import org.springframework.http.ResponseEntity;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by 9111665 on 2021-01-17.
 * Description:
 */
@Log4j2
@Service
public class FileServiceImpl implements FileService {

    @Value("${file.upload-dir}")
    private String uploadFolder;

    @Setter(onMethod = @__({@Autowired}))
    FileMapper mapper;

    @Override
    public List<FileVO> file_upload(MultipartFile[] files) throws IOException {
        List<FileVO> file_list = new ArrayList<>();

        log.info(uploadFolder);

        String uploadFolderPath = getFolder(); // 년\월\일 폴더

        File uploadPath = new File(uploadFolder, uploadFolderPath);
        if(uploadPath.exists() == false){
            uploadPath.mkdirs();
        }

        for (MultipartFile file : files){

            String uploadFileName_org = file.getOriginalFilename();
            String uploadFileName = "";
            String extension = "";

            uploadFileName_org = uploadFileName_org.substring(uploadFileName.lastIndexOf("\\") + 1);
            extension = uploadFileName_org.substring(uploadFileName_org.lastIndexOf(".") + 1);
            log.info("########### file name: " + uploadFileName_org);
            UUID uuid = UUID.randomUUID();
            uploadFileName = uuid.toString() + "_" + uploadFileName_org;

            File saveFile = new File(uploadPath, uploadFileName);
            file.transferTo(saveFile);

            file_list.add(
                    FileVO.builder()
                            .upload_path(uploadFolderPath)
                            .file_name_org(uploadFileName_org)
                            .file_name_uuid(uploadFileName)
                            .file_size(saveFile.length() / (1024*1024))
                            .extension(extension)
                            .build()
            );
        }

        return file_list;
    }

    @Override
    public boolean delete_file(int file_id) {
        return mapper.delete_file(file_id) > 0;
    }


    private String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);
        return str.replace("-", "/");
    }
}
