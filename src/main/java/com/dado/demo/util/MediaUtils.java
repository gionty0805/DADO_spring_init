package com.dado.demo.util;

import org.springframework.http.MediaType;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by 9111665 on 2021-01-17.
 * Description:
 */
public class MediaUtils {

    private static Map<String, MediaType> mediaMap;

    static {

        mediaMap = new HashMap<>();
        mediaMap.put("JPG", MediaType.IMAGE_JPEG);
        mediaMap.put("GIF", MediaType.IMAGE_GIF);
        mediaMap.put("PNG", MediaType.IMAGE_PNG);
    }

    public static MediaType getMediaType(String type) {

        return mediaMap.get(type.toUpperCase());
    }
}
