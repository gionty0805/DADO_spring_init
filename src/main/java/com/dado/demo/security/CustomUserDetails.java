package com.dado.demo.security;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

/**
 * Created by 9111665 on 2021-01-13.
 * Description:
 */
@Getter
public class CustomUserDetails implements UserDetails {

    private String USERID;
    private String PASSWORD;
    private String NAME;
    private String AUTORITY;
    private boolean ENABLED;
    private String REGISTER;
    private Date REGDATE;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> auth = new ArrayList<>();
        auth.add(new SimpleGrantedAuthority(AUTORITY));
        return auth;
    }

    @Builder
    public CustomUserDetails(String userid, String password, String name, boolean isEnabled, String register){
        //MAPPER 에서 가져오는 필드값 순서에 맞추어야한다
        this.USERID = userid;
        this.PASSWORD = password;
        this.NAME = name;
        this.AUTORITY = "USER_ADMIN"; //권한처리는 나중에
        this.ENABLED = isEnabled;
        this.REGISTER = register;
    }

    @Override
    public String getPassword() {
        return PASSWORD;
    }

    @Override
    public String getUsername() {
        return USERID;
    }

    // 계정 만료 여부 반환
    @Override
    public boolean isAccountNonExpired() {
        return true; // 만료되지 않음
    }

    // 계정 잠금 여부 반환
    @Override
    public boolean isAccountNonLocked() {
        return true; // 잠기지 않음
    }

    //패스워드 만료 여부
    @Override
    public boolean isCredentialsNonExpired() {
        return true; // 만료되지 않음
    }

    @Override
    public boolean isEnabled() {
        return ENABLED;
    }



}
