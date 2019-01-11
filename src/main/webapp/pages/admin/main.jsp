<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>后台</title>
	<!-- 导入easyui的资源文件 -->
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>/static/js/easyui/themes/icon.css">
	<script type="text/javascript" src="<%=basePath %>/static/js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>/static/js/easyui/jquery.easyui.min.js"></script>
	<!-- 汉化 -->
	<script type="text/javascript" src="<%=basePath %>/static/js/easyui/locale/easyui-lang-zh_CN.js"></script>
	<!-- 处理JSon -->
	<script type="text/javascript" src="<%=basePath %>/static/js/jsonHandler.js"></script>
</head>
<body class="easyui-layout">   
    <div data-options="region:'north',title:'北',split:true" style="height:100px;"></div>   
    <div data-options="region:'south',title:'南',split:true" style="height:100px;"></div>   
    <div data-options="region:'west',title:'导航栏',split:true,iconCls:'icon-world'" style="width:120px;">
    	<ul id="tt" data-options="lines:true,animate:true,checkbox:true">   
		</ul>  
    </div>   
    <div data-options="region:'center',title:'中间',noheader:true" style="padding:5px;background:#eee;">
    	<div id="tab" class="easyui-tabs" data-options="fit:true">   
		    <div title="首页" style="padding:20px;" data-options="iconCls:'icon-house'">   
		       	 欢迎使用物流后台管理系统    
		    </div>   
		</div> 
    </div> 
    <script type="text/javascript">
    	$(function(){
    		$('#tt').tree({    
    		    url:'<%=basePath %>/admin/getAllNavs.do',
    		    onClick:function(node){
					/* node参数是easyUI框架传递过来的，其中封装了某一个节点的具体信息：节点内容、节点的图标、节点状态 */
					//添加一个选项卡
					//alert(node.href);
					//判断节点名=node.text的节点在id=tab的标签中是否存在
					var flag = $("#tab").tabs('exists',node.text);
					if(!flag){//如果不存在再创建
						if(node.href!='NULL'){
							$("#tab").tabs('add',{
								title:node.text,/* 获取tree节点的文本内容 */
								iconCls:node.iconCls,/* 获取tree节点的图标 */
								closable:true,
								/* href属性：可以将指定页面内容加载到当前的选项卡面板中 */
								href:'<%=basePath %>/pages/'+node.href
							});
						}
					}else{//存在，则跳转到指定的选项卡
						 $("#tab").tabs('select',node.text);
					}
					
					
    		    }
    		}); 
    	});
    </script>  
</body> 
 
</html>