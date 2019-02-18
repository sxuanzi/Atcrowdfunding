package com.xuan.atcrowdfunding.manager.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuan.atcrowdfunding.bean.User;
import com.xuan.atcrowdfunding.manager.service.UserService;
import com.xuan.atcrowdfunding.util.AjaxResult;
import com.xuan.atcrowdfunding.util.MD5Util;
import com.xuan.atcrowdfunding.util.Page;
import com.xuan.atcrowdfunding.util.StringUtil;



@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping("doindex")
	public Object doindex(@RequestParam(value="pageno", required=false, defaultValue="1") Integer pageno,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize,
			String queryText) {
		AjaxResult result = new AjaxResult();
		try {
			Map<String,Object> paramMap = new HashMap<String,Object>();
			paramMap.put("pageno", pageno);
			paramMap.put("pageSize", pageSize);
			
			if(!StringUtil.isEmpty(queryText)) {
				
				if(queryText.contains("%")) {
					queryText = queryText.replaceAll("%", "\\\\%");
				}
				
				paramMap.put("queryText", queryText);
			}
			
			Page page = userService.queryPage(paramMap);
			
			result.setPage(page);
			
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("查询数据失败");
			result.setSuccess(false);
			e.printStackTrace();
		}
		
		return result;	
	}
	
	@RequestMapping("index")
	public String index() {
		return "user/index";
	}
	
	@RequestMapping("toAdd")
	public String add() {
		return "user/add";
	}
	
	@ResponseBody
	@RequestMapping("doAdd")
	public Object doAdd(User user) {
		AjaxResult result = new AjaxResult();
		System.out.println("dddd");
		try {
			System.out.println("进入了"+user.getLoginacct());
			int count = userService.saveUser(user);
			result.setSuccess(count==1);
			
		} catch (Exception e) {
			e.printStackTrace();
			result.setMessage("保存失败");
			result.setSuccess(false);
		}
		
		return result;
	}
	
	@RequestMapping("edit")
	public String edit(@RequestParam(value="uid", required=false)Integer id, Map map) {
		
		System.out.println(id);
		User user = userService.getUserByUserByUid(id);
		map.put("user",user);
		
		return "user/edit";
	}
	
	@ResponseBody
	@RequestMapping("doedit")
	public Object doEdit(User user) {
		AjaxResult result = new AjaxResult();
		
		System.out.println(user.getId());
		try {
			int count = userService.updateUser(user);
			if(count==1) {
				result.setSuccess(true);
			}else {
				result.setSuccess(false);
			}
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMessage("修改数据失败");
			e.printStackTrace();
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/doDelete", method=RequestMethod.POST)
	public Object doDelete(Integer id) {
		AjaxResult result = new AjaxResult();
		
		try {
			Integer count = userService.deleteUser(id);
			result.setSuccess(count==1);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMessage("删除数据失败---");
			e.printStackTrace();
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/doDeleteBatch", method=RequestMethod.POST)
	public Object doDeleteBatch(Integer[] id) {
		AjaxResult result = new AjaxResult();

		try {
			Integer count = userService.deleteBatchUser(id);
			result.setSuccess(count==id.length);
			
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMessage("删除数据失败---");
			e.printStackTrace();
		}
		
		return result;
	}
/*	@RequestMapping("index")
	public String index(@RequestParam(value="pageno", required=false, defaultValue="1") Integer pageno,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize,Map map) {
		
		System.out.println("index");
		Page page = userService.queryPage(pageno,pageSize);
		map.put("page", page);
		
		return "user/index";	
	}*/

}
