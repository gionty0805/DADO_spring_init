package com.dado.demo.controller;

import com.dado.demo.service.FileService;
import com.dado.demo.util.MediaUtils;
import com.dado.demo.vo.FileVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.URLEncoder;
import java.util.List;


/**
 * Created by 9111665 on 2021-01-15.
 * Description:
 */
@Log4j2
@Controller
@RequestMapping("file")
public class FileController {

    @Setter(onMethod = @__({@Autowired}))
    FileService fileService;

    @Value("${file.upload-dir}")
    private String uploadRoot;

    @PostMapping("upload")
    public @ResponseBody List<FileVO> upload(MultipartFile[] files) throws IOException {
        log.info(files);
        return fileService.file_upload(files);
    }

    @GetMapping("download")
    @ResponseBody
    public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName){
        Resource resource = new FileSystemResource(uploadRoot + fileName);

        if (resource.exists() == false) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        String resourceName = resource.getFilename();

        // remove UUID
        String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);

        HttpHeaders headers = new HttpHeaders();
        try {

            boolean checkIE = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

            String downloadName = null;

            if (checkIE) {
                downloadName = URLEncoder.encode(resourceOriginalName, "UTF8").replaceAll("\\+", " ");
            } else {
                downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
            }

            headers.add("Content-Disposition", "attachment; filename=" + downloadName);

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
    }

    @GetMapping("display")
    @ResponseBody
    public ResponseEntity<byte[]> display(String fileName) throws IOException {
        InputStream in = null;
        ResponseEntity<byte[]> entity = null;

        log.info("display name: " + fileName);

        try {
            String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

            MediaType mType = MediaUtils.getMediaType(formatName);

            HttpHeaders headers = new HttpHeaders();

            in = new FileInputStream(uploadRoot + fileName);


            if(mType != null) {
                headers.setContentType(mType);
            }else {
                fileName = fileName.substring(fileName.indexOf("_")+1);
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
            }// else

            entity = new ResponseEntity<>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

        } catch(Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close();
        }

        return entity;
    }

    @ResponseBody
    @PostMapping(value = "delete")
    public ResponseEntity<String> deleteFile(String fileName, int file_id) {

        log.info("delete Editor file: " + fileName);

        /*
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
        MediaType mType = MediaUtils.getMediaType(formatName);
        if (mType != null) {
            String front = fileName.substring(0, 12);
            String end = fileName.substring(12);
            new File(uploadRoot + (front + "s_" + end).replace('/', File.separatorChar)).delete();
        }*/
        File delete_file = new File(uploadRoot + fileName.replace('/', File.separatorChar));

        if(!delete_file.exists()) return new ResponseEntity<String>("error", HttpStatus.OK);

        boolean result = delete_file.delete();

        if(result && fileService.delete_file(file_id)) {
            return new ResponseEntity<String>("deleted", HttpStatus.OK);
        }else{
            return new ResponseEntity<String>("error", HttpStatus.OK);
        }



    }
}
