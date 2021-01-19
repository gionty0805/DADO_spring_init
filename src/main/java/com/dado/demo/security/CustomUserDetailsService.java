package com.dado.demo.security;

import com.dado.demo.mapper.UserMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * Created by 9111665 on 2021-01-13.
 * Description:
 */
@AllArgsConstructor
@Service
public class CustomUserDetailsService implements UserDetailsService {
    private UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        CustomUserDetails user = userMapper.getUser(username);
        if(user == null){
            throw new UsernameNotFoundException(username);
        }
        return user;
    }
}
