package com.dado.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
	  protected void configure(HttpSecurity http) throws Exception {
	    http.authorizeRequests()
	    //.antMatchers("/adminOnly").hasAuthority("ROLE_ADMIN")
	    .antMatchers("/**").permitAll()  // ���� ������ URL�� �Ʒ��� ��ġ�Ѵ�.
	    .anyRequest().authenticated()
	    .and()
	    .formLogin().defaultSuccessUrl("/")  
	     // formLogin: �ٸ� �ɼ� ������ ���� ��� ��ť��Ƽ�� �����ϴ� �⺻ �α��� form ������ ���
	    .and()
	    .logout().logoutSuccessUrl("/");  
	    // �α׾ƿ� �⺻ url�� (/logout)
	    // ���� �����Ϸ��� .logoutUrl("url") ���  
	    
	  }
	  
	  @Override
	  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	    auth.inMemoryAuthentication()
	    .withUser("admin").password(passwordEncoder().encode("1234")).roles("ADMIN")
	    .and()
	    .withUser("guest").password(passwordEncoder().encode("guest")).roles("GUEST");
	  }
	  
	  // passwordEncoder() �߰�
	  @Bean
	  public BCryptPasswordEncoder passwordEncoder() {
	    return new BCryptPasswordEncoder();
	  }
	  
}
