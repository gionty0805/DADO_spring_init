package com.dado.demo.security;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

/**
 * Created by 9111665 on 2021-01-13.
 * Description:
 */
@Slf4j
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

    @Setter(onMethod = @__({@Autowired}))
    private UserDetailsService userDetailsService;

    @Setter(onMethod = @__({@Autowired}))
    private PasswordEncoder passwordEncoder;

    @SuppressWarnings("unchecked")
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

        String username = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();

        CustomUserDetails userDetails = (CustomUserDetails) userDetailsService.loadUserByUsername(username);

        if(!passwordEncoder.matches(password, userDetails.getPassword())){
            throw new BadCredentialsException(username);
        }

        if(!userDetails.isEnabled()){
            throw new BadCredentialsException(username);
        }

        //여기서 이거 나중에 구현
        if(!userDetails.isAccountNonLocked()){
            throw new BadCredentialsException(username);
        }

        return new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
}
