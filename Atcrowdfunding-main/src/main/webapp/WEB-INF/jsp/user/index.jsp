<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CH">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="stylesheet" href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/main.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	table tbody tr:nth-child(odd){background:#F4F4F4;}
	table tbody td:nth-child(even){color:#C00;}
	</style>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 用户维护</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li style="padding-top:8px;">
				<div class="btn-group">
				  <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
					<i class="glyphicon glyphicon-user"></i> 张三 <span class="caret"></span>
				  </button>
					  <ul class="dropdown-menu" role="menu">
						<li><a href="#"><i class="glyphicon glyphicon-cog"></i> 个人设置</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-comment"></i> 消息</a></li>
						<li class="divider"></li>
						<li><a href="index.html"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
					  </ul>
			    </div>
			</li>
            <li style="margin-left:10px;padding-top:8px;">
				<button type="button" class="btn btn-default btn-danger">
				  <span class="glyphicon glyphicon-question-sign"></span> 帮助
				</button>
			</li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
			<div class="tree">
				<ul style="padding-left:0px;" class="list-group">
					<li class="list-group-item tree-closed" >
						<a href="main.html"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a> 
					</li>
					<li class="list-group-item">
						<span><i class="glyphicon glyphicon glyphicon-tasks"></i> 权限管理 <span class="badge" style="float:right">3</span></span> 
						<ul style="margin-top:10px;">
							<li style="height:30px;">
								<a href="user.html" style="color:red;"><i class="glyphicon glyphicon-user"></i> 用户维护</a> 
							</li>
							<li style="height:30px;">
								<a href="role.html"><i class="glyphicon glyphicon-king"></i> 角色维护</a> 
							</li>
							<li style="height:30px;">
								<a href="permission.html"><i class="glyphicon glyphicon-lock"></i> 许可维护</a> 
							</li>
						</ul>
					</li>
					<li class="list-group-item tree-closed">
						<span><i class="glyphicon glyphicon-ok"></i> 业务审核 <span class="badge" style="float:right">3</span></span> 
						<ul style="margin-top:10px;display:none;">
							<li style="height:30px;">
								<a href="auth_cert.html"><i class="glyphicon glyphicon-check"></i> 实名认证审核</a> 
							</li>
							<li style="height:30px;">
								<a href="auth_adv.html"><i class="glyphicon glyphicon-check"></i> 广告审核</a> 
							</li>
							<li style="height:30px;">
								<a href="auth_project.html"><i class="glyphicon glyphicon-check"></i> 项目审核</a> 
							</li>
						</ul>
					</li>
					<li class="list-group-item tree-closed">
						<span><i class="glyphicon glyphicon-th-large"></i> 业务管理 <span class="badge" style="float:right">7</span></span> 
						<ul style="margin-top:10px;display:none;">
							<li style="height:30px;">
								<a href="cert.html"><i class="glyphicon glyphicon-picture"></i> 资质维护</a> 
							</li>
							<li style="height:30px;">
								<a href="type.html"><i class="glyphicon glyphicon-equalizer"></i> 分类管理</a> 
							</li>
							<li style="height:30px;">
								<a href="process.html"><i class="glyphicon glyphicon-random"></i> 流程管理</a> 
							</li>
							<li style="height:30px;">
								<a href="advertisement.html"><i class="glyphicon glyphicon-hdd"></i> 广告管理</a> 
							</li>
							<li style="height:30px;">
								<a href="message.html"><i class="glyphicon glyphicon-comment"></i> 消息模板</a> 
							</li>
							<li style="height:30px;">
								<a href="project_type.html"><i class="glyphicon glyphicon-list"></i> 项目分类</a> 
							</li>
							<li style="height:30px;">
								<a href="tag.html"><i class="glyphicon glyphicon-tags"></i> 项目标签</a> 
							</li>
						</ul>
					</li>
					<li class="list-group-item tree-closed" >
						<a href="param.html"><i class="glyphicon glyphicon-list-alt"></i> 参数管理</a> 
					</li>
				</ul>
			</div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
<form class="form-inline" role="form" style="float:left;">
  <div class="form-group has-feedback">
    <div class="input-group">
      <div class="input-group-addon">查询条件</div>
      <input id="queryText" class="form-control has-success" type="text" placeholder="请输入查询条件">
    </div>
  </div>
  <button id="queryBtn" type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
</form>
<button type="button" id="deleteBatchBtn" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
<button type="button" class="btn btn-primary" style="float:right;" onclick="Increase()"><i class="glyphicon glyphicon-plus"></i> 新增</button>
<br>
 <hr style="clear:both;">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
				  <th width="30"><input id="checkboxAll" type="checkbox"></th>
                  <th>账号</th>
                  <th>名称</th>
                  <th>邮箱地址</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
  
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="6" align="center">
						<ul class="pagination">
					
						</ul>
					 </td>
				 </tr>

			  </tfoot>
            </table>
          </div>
			  </div>
			</div>
        </div>
      </div>
    </div>

    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
	<script type="text/javascript" src="${APP_PATH }/jquery/layer/layer.js"></script>
        <script type="text/javascript">
            $(function () {
			    $(".list-group-item").click(function(){
				    if ( $(this).find("ul") ) {
						$(this).toggleClass("tree-closed");
						if ( $(this).hasClass("tree-closed") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
						}
					}
				});
			    
			     queryPageUser(1);
            });
            $("tbody .btn-success").click(function(){
                window.location.href = "assignRole.html";
            });
            $("tbody .btn-primary").click(function(){
                window.location.href = "edit.html";
            });
            
            function pageChange(pageno){
				queryPageUser(pageno);
            }
            
            var dataObj = {
            	"pageno": 1,
            	"pageSize": 10
            }
            
            $("#queryBtn").click(function(){
            	var queryText =  $("#queryText").val();
            	
            	if($.trim(queryText)==""){
            		layer.msg("询条件值不允许为空,请输入查询条件!", {time:2000, icon:5, shift:6}, function(){
            			$("#queryText").focus();
            		});
            		return ;
            	}
            	
            	dataObj.queryText = queryText;
            	queryPageUser(1);
            });
            
            function queryPageUser(pageno){
            	dataObj.pageno = pageno;
            	
            	$.ajax({
            		type: "POST",
            		url: "${APP_PATH}/user/doindex.do",
            		data: dataObj,
            		beforeSend: function(){
            			return true;
            		},
            		success : function(result){
            			if(result.success){
            				var page = result.page;
            				data = page.datas;
            				
            				var content = "";
            
            				
            				$.each(data,function(index,user){
            					
	            				content += '<tr>';
	            				content += '  <td>'+(index+1)+'</td>';
	            				content += '  <td><input type="checkbox" id='+user.id+'></td>';
	            				content += '  <td>'+user.loginacct+'</td>';
	            				content += '  <td>'+user.username +'</td>';
	            				content += '  <td>'+user.email +'</td>';
	            				content += '  <td>';
	            				content += '	  <button type="button" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>';
	            				content += '	  <button type="button" onclick="window.location.href=\'${APP_PATH}/user/edit.htm?uid= '+user.id+'\'" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
	            				content += '	  <button type="button" onclick="deleteUser('+user.id+',\''+user.username+'\')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
	            				content += '  </td>';
	            				content += '</tr>'
            					
            				}); 
            				$("tbody").html(content);
            				
            				var contentNavigater = "";
            				
            				if(page.pageno ==1){
            					contentNavigater += '<li class="disabled"><a href="#">上一页</a></l>';
            				}else{
            					contentNavigater += '<li ><a href="#" onclick="pageChange('+(page.pageno-1)+')">上一页</a></li>';
            				}
            				
            			
	            			for(var i=1; i <=page.totalno; i++){
	            				contentNavigater += '<li ';	
	            					if(pageno == i){
	            						contentNavigater +=' class="active"'; 	
	            					}
								contentNavigater += '><a href="#" onclick="pageChange('+i+')">'+i+' <span class="sr-only">(current)</span></a></li>';
	            			}

	        				if(page.pageno == page.totalno){
	        					contentNavigater += '<li class="disabled"><a href="#">下一页</a></li>';
	        				}else{
	        					contentNavigater += '<li><a href="#"  onclick="pageChange('+(page.pageno+1)+')">下一页</a></li>';
	        				}
            				
            				$(".pagination").html(contentNavigater);
            			}else{
            				layer.msg(result.message, {time:1000, icon:5, shift:6});
            			}
            			
            		},	
            		error: function  (){
            			layer.msg("分页查询失败",{time:100, icon:5,shift:6})
            		}
            	});
            	return ;
            }
            
            function Increase(){
            	window.location.href='${APP_PATH}/user/toAdd.do';
            }
            
            function deleteUser(id,username){
            	
        	    layer.confirm("确定要删除 ["+username+"] 用户吗？",  {icon: 3, title:'提示'}, function(cindex){
    			   
        	    	$.ajax({
                		url:"${APP_PATH}/user/doDelete.do",
                		type: "POST",
                		data:{
                			"id" : id
                		},
                		beforeSend : function(){
                			return true;
                		},
                		success : function(result){
                			
                			if(result){
                				window.location.href = "${APP_PATH}/user/index.htm";
                			}else{
                				layer.msg(result.message, {time:1000, icon:5, shift:6});
                			}
                		},
                		error: function(){
                			layer.msg("删除失败",{time:1000, icon:5,shift:6})
                		}
                	});
            		
    			}, function(cindex){
    			    layer.close(cindex);
    			}); 
            	
            };
            
            
            $("#checkboxAll").click(function(){
            	var checkboxAllStatus  = this.checked;
            	
            	$("tbody tr td input[type='checkbox']").prop("checked",checkboxAllStatus);
            });
            
            $("#deleteBatchBtn").click(function(){
            	
            	var selectCheckbox = $("tbody tr td input:checked");
            	var length = selectCheckbox.length;
            	
            	var paramStr = "";
            	$.each(selectCheckbox, function(index,n){
            		if(index != 0){
            			paramStr += "&";
            		}
            		paramStr += "id="+n.id;
            	});
            	alert(paramStr);
            	
            	if(length > 0 ){
            		layer.confirm("删除这些用户,确认删除?",  {icon: 3, title:'提示'}, function(cindex){
            			var loadingIndex = -1;
            			
            			$.ajax({
            				type: "POST",
            				url: "${APP_PATH}/user/doDeleteBatch.do",
            			 	data: paramStr, 
            				beforeSend: function(){
            					loadingIndex = layer.msg("正在删除数据!", {time:1000, icon:6});	      
            					return true ;
            				},
            				success: function(result){
            					layer.close(loadingIndex);
            					if(result){
            						queryPageUser(1);
            					}else{
            						layer.msg("删除失败!", {time:1000, icon:5, shift:6});
            					}
            				},
            				error:function(){
            					layer.msg("删除失败!", {time:1000, icon:5, shift:6});
            				}
            			});
            			
            			layer.close(cindex);
            		},function(cindex){
            			layer.close(cindex);
            		});
            	}else{
            		layer.msg("请选择要删除的用户！", {time:1000, icon:5, shift:6});
            	}
            	
            });
        </script>
  </body>
</html>
