package com.miniproject;

import java.util.NoSuchElementException;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.miniproject.entity.Account;
import com.miniproject.service.AccountService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	AccountService accountService;
	@Autowired
	BCryptPasswordEncoder pe;

	// Mã hóa mật khẩu
	@Bean
	public BCryptPasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	// Cung cấp dữ liệu đăng nhập
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(username -> {
			try {
				Account user = accountService.findById(username);		
				String password = pe.encode(user.getPassword());
				String[] roles = user.getAuthorities().stream()
						.map(er -> er.getRole().getId())
						.collect(Collectors.toList()).toArray(new String[0]);
				return User.withUsername(username).password(password).roles(roles).build();
			} catch (NoSuchElementException e) {
				throw new UsernameNotFoundException(username + "not found!");
			}
		});
	}

	// Phân quyền sử dụng
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// CSRF, CORS
			http.csrf().disable();

	    // Phân quyền sử dụng 
			http.authorizeRequests()
				.antMatchers("/order/**").authenticated()
				.antMatchers("/admin/**").hasAnyRole("PM","ADMIN")
				.antMatchers("/rest/authorities").hasRole("ADMIN")
				.anyRequest().permitAll();

		// Giao diện đăng nhập
			http.formLogin()
				.loginPage("/security/login/form")
				.loginProcessingUrl("/security/login")
				.defaultSuccessUrl("/security/login/success", false)
				.failureUrl("/security/login/error");
			
			http.rememberMe()
				.tokenValiditySeconds(86400);
		
		//Điều khiển lỗi truy cập không đúng vai trò		
			http.exceptionHandling()
				.accessDeniedPage("/security/unauthoried");	

		// Đăng xuất
		http.logout().logoutUrl("/security/logoff").logoutSuccessUrl("/security/logoff/success");
	}
	
		// Cho phép truy xuất REST API từ bên ngoài (domain khác)
		@Override
		public void configure(WebSecurity web) throws Exception {
			web.ignoring().antMatchers(HttpMethod.OPTIONS,"/**");
		}
}
