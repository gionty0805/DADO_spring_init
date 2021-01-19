package com.dado.demo;

import com.dado.demo.mapper.UserMapper;
import com.dado.demo.security.CustomUserDetails;
import jdk.nashorn.internal.objects.annotations.Setter;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest
class Demo1ApplicationTests {

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private PasswordEncoder encoder;

	@Test
	void insert() {

		userMapper.insertUser(CustomUserDetails.builder()
				.userid("test2")
				.password(encoder.encode("2"))
				.isEnabled(true)
				.name("테스트투").build());
	}

	@Test
	void get() {
		userMapper.getUser("test");
	}

}
