package com.xuan.atcrowdfunding.controller;

import java.util.HashMap;
import java.util.Map;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuan.atcrowdfunding.bean.User;
import com.xuan.atcrowdfunding.manager.service.UserService;
import com.xuan.atcrowdfunding.util.AjaxResult;
import com.xuan.atcrowdfunding.util.Const;
import com.xuan.atcrowdfunding.util.MD5Util;

@Controller
public class DispatcherController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/index")
	public String index() {
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
	
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		//销毁session对象
		session.invalidate();
		return "redirect:/index.htm";
	}
	
	
	//异步请求
	/**
	 *  @ResponseBody 结合Jackson组件，将返回结构转换为字符串，将JSON以六的形式放回给客户端
	 * 
	 */
	@ResponseBody
	@RequestMapping("/doLogin")
	public Object doLogin(String loginacct,String userpswd,String type,HttpSession seesion) {
		
		AjaxResult result = new AjaxResult();
		
		try {
			
			Map<String,Object> paramMap = new HashMap<String, Object>();
			paramMap.put("loginacct", loginacct);
			paramMap.put("userpswd", MD5Util.digest(userpswd));	
			paramMap.put("type", type);
			System.out.println(loginacct+""+userpswd+""+type);
		
			User user = userService.queryUserLogin(paramMap);
			
			seesion.setAttribute(Const.LOGIN_USER, user);
			
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("登陆失败");
			result.setSuccess(false);
			e.printStackTrace();
			
		}
		
		return result;
	}
	
	//同步请求
/*	@RequestMapping("/doLogin")
	public String doLogin(String loginacct,String userpswd,String type,HttpSession seesion) {
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("loginacct", loginacct);
		System.out.println(loginacct+""+userpswd+""+type);
		paramMap.put("userpswd", userpswd);	
		paramMap.put("type", type);
		
		seesion.setAttribute(Const.LOGIN_USER, paramMap);
		
		User user = userService.queryUserLogin(paramMap);
		
		return "redirect:/main.htm";
	}*/

}
