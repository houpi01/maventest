<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>菜单管理</title>
</head>
<body>
	<table id="dg"></table> 
	<script type="text/javascript">
		$(function(){
			$('#dg').datagrid({    
			    url:'<%=basePath %>/admin/getAllCaiDan.do',    
			    columns:[[ //控制easyui的表头   
			    	{checkbox:true},//复选框
			        {field:'id',title:'主键',width:180,align:'center'},    
			        {field:'text',title:'菜单名称',width:180,align:'center',formatter: function(value,row,index){
			        	if(row.pid==0){//一级菜单
			        		return "<span style='color:red'>"+value+"</span>";
			        	}else{
			        		return value;
			        	}
			        }},    
			        {field:'state',title:'菜单展开状态',width:180,align:'center',formatter: function(value,row,index){
			        	//if(value=='open'){
			        	if(row.state=='open'){
			        		return '展开';
			        	}else{
			        		return '关闭';
			        	}
			        }},  
			        {field:'iconCls',title:'菜单图标',width:180,align:'center'},    
			        {field:'pid',title:'父标签主键',width:180,align:'center'},    
			        {field:'href',title:'菜单链接',width:180,align:'center',
			        	formatter:function(value,row,index){
			        		if(row.href=='NULL'){
			        			return '无链接';			        
			        		}else{
			        			return value;
			        		}
			        	}
			        }
			    ]],
			    pagination:true,
			    fit:true,
			    /* singleSelect:true, */
			    toolbar:[
			    	{
			    		iconCls:'icon-add',
			    		text:'添加菜单',
			    		handler:function(){//当点击添加菜单时，会执行此处的handler函数
			    			$("#add").window({
			    				title:'添加菜单',
			    				iconCls:'icon-add',
			    				width:400,
			    				height:300,
			    				resizable:false
			    			});
			    		
			    			showFirst();//调用函数
			    		}
			    	},'-',
			    	{
			    		iconCls:'icon-edit',
			    		text:'修改菜单',
			    		handler:function(){alert('修改菜单')}
			    	},'-',
			    	{
			    		iconCls:'icon-remove',
			    		text:'批量删除',
			    		handler:function(){
			    			//1、获取所有的被选中行的id
			    			var rows = $("#dg").datagrid('getSelections');
			    			var len = rows.length;
			    			var idStr="";//用来拼接id
			    			if(len>=1){
			    				for(var i in rows){//此处的i为数组的小标
			    					var tempId = rows[i].id;
			    					idStr+=tempId+",";
			    				}
			    				
			    				//将idStr传递给后台
			    				$.ajax({
			    					url:'<%=basePath %>/admin/batchDel.do',
			    					type:'post',
			    					dataType:'json',
			    					data:{'idStr':idStr},
			    					success:function(result){
			    						if(result){//删除成功
			    							$("#dg").datagrid('reload');
			    						}
			    					}
			    				});
			    			}else{//删除时没有选中任何行
			    				$.messager.alert('警告','请选择要删除的行'); 
			    			}
			    		}
			    	}
			    ]
			});
		});
	</script>
	<!-- 添加菜单 -->
	<div id="add">
		<center style="padding-top: 25px">
			<form id="form1">
			<p>菜单名称：<input type="text" name="caiDanName"></p>
			<p>展开状态：
				<select name="state">
					<option value="open">展开</option>
					<option value="closed" selected="selected">关闭</option>
				</select>
			</p>
			<p>菜单图标：<input type="text" name="iconCls"></p>
			<p>菜单链接：<input type="text" name="href"></p>
			<p>父标签键：
				<select name="pid" id="pid">
					<option value="0" selected="selected">无</option>
				</select>
			</p>
			<p>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" id="ok">确定</a>
				&nbsp;
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
			</p>
			</form>
		</center>
	</div>
	<script type="text/javascript">
		$("#ok").click(function(){
			$.ajax({
				url:'<%=basePath %>/admin/addCaiDan.do',
				type:'post',
				data:$("#form1").serializeObject(),
				dataType:'json',
				contentType:'application/json',
				success:function(result){
					if(result){//添加成功
						//将添加窗口关闭
						$("#add").window('close');
						//弹出添加的提示框
						$.messager.show({
		    				title:'添加提示',
		    				msg:'成功添加一条记录!',
		    				timeout:3000,//隐藏时间
		    				showType:'slide'//指定窗口显示的方式
		    			});
						//重新加载表格
						//$("#dg").datagrid('reload');
						window.location.reload();
					}else{//添加失败
						
					}
				}
			}); 
		});
		
		//当该表下拉框时，触发事件
		<%-- $("#pid").click(function(){
			$.ajax({
				url:'<%=basePath %>/admin/getFirstMenu.do',
				type:'post',
				dataType:'json',
				success:function(result){//List<Map<String,Object>>:json
					for(var i in result){//遍历List集合
						//获取map
						var map = result[i];
						//alert(map.id+"|"+map.text);
						$("#pid").append("<option value='"+map.id+"'>"+map.text+"</option>");
					}
				}
			});
		}); --%>
		function showFirst(){//显示一级菜单
			$.ajax({
				url:'<%=basePath %>/admin/getFirstMenu.do',
				type:'post',
				dataType:'json',
				success:function(result){//List<Map<String,Object>>:json
					for(var i in result){//遍历List集合
						//获取map
						var map = result[i];
						//alert(map.id+"|"+map.text);
						$("#pid").append("<option value='"+map.id+"'>"+map.text+"</option>");
					}
				}
			});
		}
	</script>
</body>
</html>