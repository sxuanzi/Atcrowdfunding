<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/login.css">
	<style>

	</style>
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <div><a class="navbar-brand" href="index.html" style="font-size:32px;">尚筹网-创意产品众筹平台</a></div>
        </div>
      </div>
    </nav>

    <div class="container">
    
		${exception.message }
      <form id="LoginForm" class="form-signin" role="form" action="${APP_PATH }/doLogin.do" method="POST">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 用户登录</h2>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="floginacct" name="loginacct" value="zhang" placeholder="请输入登录账号" autofocus>
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="password" class="form-control" id="fuserpswd" name="userpswd" value="123" placeholder="请输入登录密码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<select id="ftype" class="form-control" name="type" >
                <option value="member">会员</option>
                <option value="user" selected="selected">管理</option>
            </select>
            <span id="error" style="color:red" class=""></span>
		  </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 记住我
          </label>
          <br>
          <label>
            忘记密码
          </label>
          <label style="float:right">
            <a href="reg.html">我要注册</a>
          </label>
        </div>
        <a class="btn btn-lg btn-success btn-block" onclick="dologin()" > 登录</a>
      </form>
    </div>
    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${APP_PATH }/jquery/layer/layer.js"></script>
    <script>
    function dologin() {
    	var loginacct = $("#floginacct");
    	var userpswd = $("#fuserpswd");
    	var type = $("#ftype");
    	
    	if($.trim(loginacct.val()) == ""){
			layer.msg("请输入用户名", {time:1000, icon:5, shift:6}, function(){
				$("#loginacct").val("");
	    		$("#loginacct").focus();
			});
			
    		return false;
    	}
    	if($.trim(userpswd.val()) == ""){
    		layer.msg("请输入密码", {time:1000, icon:5, shift:6}, function(){
        		$("#userpswd").val("");
        		$("#userpswd").focus();
			});
    		return false;
    	}
 
    	var loadingIndex  = -1;
    	
    	$.ajax({
    		type : "POST",
    		url : "${APP_PATH}/doLogin.do",
    		data : {
    			"loginacct" : loginacct.val(),
    			"userpswd" : userpswd.val(),
    			"type" : type.val()
    		},
    		beforeSend : function(){
    			loadingIndex = layer.msg('处理中', {icon: 16});
    			return true;
    		},
    		success : function(result){
    			layer.close(loadingIndex);
    			if(result.success){
    				window.location.href = "${APP_PATH}/main.htm";
    			}else{
    				layer.msg(result.message, {time:1000, icon:5, shift:6});
    			}
    		},
    		error : function(result){
    			layer.msg("登陆失败！！！", {time:1000, icon:5, shift:6});
    		}
    		
    	});
    	
    	//$("#LoginForm").submit();
    	
    /*     var type = $(":selected").val();
        if ( type == "user" ) {
            window.location.href = "main.html";
        } else {
            window.location.href = "index.html";
        } */
    }
    </script>
  </body>
</html>