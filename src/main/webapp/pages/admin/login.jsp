<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>登录</title>
	<!-- 导入easyui的资源文件 -->
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/js/easyui/themes/icon.css">
	<script type="text/javascript" src="<%=basePath %>/static/js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>/static/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>/static/js/jsonHandler.js"></script>
</head>
<body>
	<div id="win">
		<center style="padding-top: 30px">
			<form id="form">
				<p>用户名：<input type="text" name="username"></p>
				<p>密&nbsp;码：<input type="password" name="password"></p>
				<p>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" id="login">登录</a>  
					&nbsp;
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>  
				</p>
			</form>
		</center>
	</div>  
	<script type="text/javascript">
		$(function(){
			$('#win').window({    
			    width:300,    
			    height:200,    
			    modal:true,
			    title:'登录',/* 设置窗口的标题 */
			    iconCls:'icon-login'/* 设置窗口的图标 */,
			    draggable:false,
			    collapsible:false,
			    resizable:false
			});
			
			//给登录按钮添加单击事件
			$("#login").click(function(){
				//var param = $("#form").serializeObject();
				$.ajax({
					url:'<%=basePath %>/admin/isLogin.do',
					type:'post',
					data:{
						username:$("input[name=username]").val(),
						password:$("input[name=password]").val(),
					},
					dataType:'json',
					success:function(result){
						if(result==true){//登录成功
							window.location.href="<%=basePath %>/pages/admin/main.jsp";
						}else{//登录失败
							//提示信息
							$.messager.confirm('确认','账号名或者密码错误!',function(r){    
							    if (r){  //点击了确认按钮  
							    	$("input[name=username]").val("");
									$("input[name=password]").val("");
									$("input[name=username]").focus();
							    }   
							});  

						}
					}
				});
			});
		});
	</script>
</body>
</html>