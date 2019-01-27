package com.xuan.atcrowdfunding.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xuan.atcrowdfunding.bean.User;
import com.xuan.atcrowdfunding.manager.service.UserService;
import com.xuan.atcrowdfunding.util.Const;

@Controller
public class DispatcherController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/index")
	public String index() {
		System.out.println("aaa");
		return "index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/doLogin")
	public String doLogin(String loginacct,String userpaswd,String type,HttpSession seesion) {
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("loginacct", loginacct);
		paramMap.put("userpaswd", userpaswd);	
		paramMap.put("type", type);
		
		seesion.setAttribute(Const.LOGIN_USER, paramMap);
		
		User user = userService.queryUserLogin(paramMap);
		
		return "redirect:/main.htm";
	}

}
