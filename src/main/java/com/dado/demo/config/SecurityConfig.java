package com.dado.demo.config;

import com.dado.demo.security.CustomAuthenticationProvider;
import com.dado.demo.security.CustomLoginFailureHandler;
import com.dado.demo.security.CustomUserDetailsService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Setter(onMethod = @__({@Autowired}))
    private CustomAuthenticationProvider customAuthenticationProvider;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                //.antMatchers("/adminOnly").hasAuthority("ROLE_ADMIN")
                //.antMatchers("/**").permitAll()
                .antMatchers("/admin").hasRole("ADMIN")
                .anyRequest().authenticated();

        http.formLogin()
                .loginPage("/login").permitAll()
                .loginProcessingUrl("/login")
                .failureHandler(failuareHandler())
                .defaultSuccessUrl("/");


        http.logout().logoutSuccessUrl("/login");
        // CUSTOM logout (/logout)
        // custom logout url .logoutUrl("url")

        http.httpBasic();

    }

    @Bean
    public AuthenticationFailureHandler failuareHandler() {
        return new CustomLoginFailureHandler();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        //auth.inMemoryAuthentication()
        //.withUser("admin").password(passwordEncoder().encode("1234")).roles("ADMIN")
        //.and()
        //.withUser("guest").password(passwordEncoder().encode("guest")).roles("GUEST");
        auth.authenticationProvider(customAuthenticationProvider);
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web
                .ignoring()
                .antMatchers("/resources/**"); // #3
    }


}
