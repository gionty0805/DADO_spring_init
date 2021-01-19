package com.dado.demo.security;

import org.springframework.security.authentication.*;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

import javax.naming.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Created by 9111665 on 2021-01-13.
 * Description:
 */
@Service
public class CustomLoginFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, org.springframework.security.core.AuthenticationException exception) throws IOException, ServletException {
        if (exception instanceof AuthenticationServiceException) {
            request.setAttribute("", "존재하지 않는 사용자입니다.");

        } else if(exception instanceof BadCredentialsException) {
            request.setAttribute("loginFailMsg", "아이디 또는 비밀번호가 틀립니다.");

        } else if(exception instanceof LockedException) {
            request.setAttribute("loginFailMsg", "잠긴 계정입니다..");

        } else if(exception instanceof DisabledException) {
            request.setAttribute("loginFailMsg", "비활성화된 계정입니다..");

        } else if(exception instanceof AccountExpiredException) {
            request.setAttribute("loginFailMsg", "만료된 계정입니다..");

        } else if(exception instanceof CredentialsExpiredException) {
            request.setAttribute("loginFailMsg", "비밀번호가 만료되었습니다.");
        }

        // 로그인 페이지로 다시 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/login");
        dispatcher.forward(request, response);
    }
}
