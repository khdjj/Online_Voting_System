<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>普通用户管理</title>
		<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
		<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/demo/demo.css">
		<link rel="stylesheet" type="text/css" href="css/user_Mana.css"/>
		<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
		<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="js/user_Mana.js"></script>
	</head>
	<body>
		<table id="dg" title="普通用户管理" class="easyui-datagrid" style="width:1074px;height:540px;	" url="user_getUserData" toolbar="#toolbar"
		 pagination="true" rownumbers="true" fitColumns="true" >
			<thead>
				<tr>
<!-- 					<th field="ck" checkbox="true"></th>
 -->					
 					<th field="userId" width="50">用户ID</th>
 					<th field="username" width="50">用户名</th>
					<th field="phone" width="50">电话</th>
					<th field="pwd" width="50">密码</th>
					<th field="sex" width="50">性别</th>
					<th field="age" width="50">年龄</th>
					<th field="city" width="50">城市</th>
					<th
					data-options="field:'status',width:100,
						formatter:function(value,row){
						console.log(value);
							if(value == 1) return '已激活';
							else if(value == 0) return '未激活';
							
						}">状态</th>
					<th
					data-options="field:'apply',width:100,
						formatter:function(value,row){
						console.log(value);
							if(value == 1) return '已申请';
							else if(value == 0) return '未申请';
							
						}">是否申请</th>
				</tr>
			</thead>
		</table>
		<div id="toolbar">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加用户</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑用户</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteUser()">删除用户</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="showAllUser()">显示全部</a>
			<a	href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-delete" plain="true" onclick="deleteSomeUser()">批量删除</a>
			<a href="userAllListServlet" class="easyui-linkbutton"iconCls="icon-export" plain="true" target = "_black"></a>
			 <span class="search_key" >查询关键字：</span> 
			 <select class="search_list" name="sort"  style="width: 150px;">
			 <option value="username">用户名</option>
			 <option value="status">状态</option>
			</select>
			<input type ="text" class="easyui-searchbox" id="searchbox" data-options="prompt:'请输入查询内容'" style="width:300px;">
		</div>

		<div id="dlg" class="easyui-dialog" style="width:400px;height:250px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
			<form id="fm" method="post">
				<table cellspacing="10px;">
					<tr>
						<td>帐号ID：</td>
						<td><input name="userId" class="easyui-validatebox" style="width: 200px;"></td>
					</tr>
					<tr>
						<td>用户名：</td>
						<td><input name="username" class="easyui-validatebox" style="width: 200px;"></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input name="pwd" class="easyui-validatebox" style="width: 200px;"></td>
					</tr>
					<tr>
						<td>电话号码：</td>
						<td><input name="phone" class="easyui-validatebox" style="width: 200px;"></td>
					</tr>
					<tr>
						<td>年龄：</td>
						<td><input name="age" class="easyui-validatebox"style="width: 200px;"></td>
					</tr>
					<tr>
						<td>性别：</td>
						<td><input name="sex" class="easyui-validatebox"style="width: 200px;"></td>
					</tr>
					<tr>
						<td>城市：</td>
						<td><input name="city" class="easyui-validatebox"  style="width: 200px;"></td>
					</tr>
					<tr>
					<td>状态：</td>
					<td><select class="easyui-combobox " name="status" required = "true">
							<option selected="selected" disabled="disabled"  value=''></option>
							<option value="激活">激活</option>
							<option value="禁用">禁用</option>
					</select></td>
				</tr>			
				</table>
			</form>
		</div>

		<div id="dlg-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">关闭</a>
		</div>
	</body>
</html>
