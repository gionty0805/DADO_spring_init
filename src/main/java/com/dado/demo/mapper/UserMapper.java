package com.dado.demo.mapper;

import com.dado.demo.security.CustomUserDetails;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

/**
 * Created by 9111665 on 2021-01-13.
 * Description:
 */
@Component
public interface UserMapper {

    CustomUserDetails getUser(String userid);

    int insertUser(CustomUserDetails userDetails);
}
