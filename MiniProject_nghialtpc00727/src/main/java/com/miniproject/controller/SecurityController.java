package com.miniproject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.miniproject.service.AccountService;

@Controller
public class SecurityController {
	@Autowired
	AccountService accountService;
	@Autowired
	HttpServletRequest request;

	@RequestMapping("/security/login/form")
	public String loginForm(Model model) {
		model.addAttribute("message", "Vui lòng đăng nhập");
		return "security/login";
	}

	@RequestMapping("/security/login/success")
	public String loginSuccess(Model model) {
//		model.addAttribute("message","Đăng nhập thành công");
		return "redirect:/product/list";
	}

	@RequestMapping("/security/login/error")
	public String loginError(Model model) {
		model.addAttribute("message", "Sai thông tin đăng nhập");
		return "security/login";
	}

	@RequestMapping("/security/logoff/success")
	public String logoffSuccess(Model model) {
//		model.addAttribute("message","Đăng xuất thành công");
		return "redirect:/product/list";
	}

	@RequestMapping("/security/unauthoried")
	public String unauthoried(Model model) {
//		model.addAttribute("message","Bạn không có quyền truy xuất");
		return "redirect:/product/list";
	}
}
