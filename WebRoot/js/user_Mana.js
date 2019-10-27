$(function(){
	
	let searchbutton = document.getElementsByClassName("searchbox-button")[0],
		searchbox = document.getElementsByClassName("searchbox-text")[0],
		search_list = document.getElementsByClassName("search_list")[0];
		searchbutton.onclick = function(){
		var value = searchbox.value,
			key = search_list.options[search_list.selectedIndex].value;
		console.log(value,key);
		$('#dg').datagrid({
		    url:'user_search?value='+value+'&key='+key,
		});
	}
});


var url;
var accountList;
function deleteUser() {
	var row = $('#dg').datagrid('getSelected');
	var rowlist =  $('#dg').datagrid('getSelections');
	if(rowlist.length>1){
		$.messager.alert("系统提示", "只能选择一行");
	}else if (row) {
		$.messager.confirm("系统提示", "您确定要删除这条记录吗?", function(r) {
			if (r) {
				$.post('UserDeleteServlet', {
					accountList: row.account
				}, function(result) {
					
					if (result.success) {
						$.messager.alert("系统提示", "已成功删除这条记录");
						$("#dg").datagrid("reload");
					} else {
						$.messager.alert("系统提示", "对不起，删除失败");
					}
				}, 'json');
			}
		});
	}
}

function newUser() {
	
	$("#dlg").dialog('open').dialog('setTitle', '添加用户');
	$('#fm').form('clear');
	url = 'userSaveServlet?flag=1';
	
}

function editUser() {
	var row = $('#dg').datagrid('getSelected');
	if (row) {
		$("#dlg").dialog('open').dialog('setTitle', '编辑用户');
		$('#fm').form('load', row);
		url = 'user_edit';
	}
}


function saveUser() {
	$('#fm').form('submit', {
		url: url,
		success: function(result) {
			console.log(result);
			var result = JSON.parse(result);
			if (result.errorMsg) {
				$.messager.alert("系统提示", result.errorMsg);
				return;
			} else {
				$.messager.alert("系统提示", "保存成功");
				$('#dlg').dialog('close');
				$("#dg").datagrid("reload");
			}
		}
	});
}



function showAllUser(){
	 var page = $("#dg").datagrid('options').pageNumber;  
	 var rows = $("#dg").datagrid('options').pageSize;  
	console.log(page,rows)
	 $.ajax({
		type:"post",
		url:"user/getUserData",
		data:{
		      "page":page,
		      "rows":rows,
			},
		success:function(result){  
			   var converData = $.parseJSON(result);
		       $("#dg").datagrid("loadData", converData);
		       console.log("系统提示", '载入成功');
		}
	}); 
}

//改写默认的表单验证
$.extend($.fn.validatebox.defaults.rules, {
	pass: {
		validator: function(value, param) {
			var frm = param[0],
				groupname = param[1];
			var ok = false;
			$('input[name="' + groupname + '"]', document[frm]).each(function() { //查找表单中所有此名称的radio
				if (/^\w{6,16}$/.test(this.value)) {
					ok = true;
					return false;
				}
			});
			return ok;
		},
		message: '此项长度为5位以上！'
	},
	tel: {
		validator: function(value, param) {
			var frm = param[0],
				groupname = param[1];
			var ok = false;
			$('input[name="' + groupname + '"]', document[frm]).each(function() { //查找表单中所有此名称的radio
				console.log(this.value);
				if (/^1[3|4|5|7|8][0-9]{9}$/.test(this.value)) {
					ok = true;
					return false;
				}
			});
			return ok;
		},
		message: '电话号码格式不正确，请重新填写！'
	}
});

function deleteSomeUser(){
	accountList = "";
	var selectRows = $("#dg").datagrid("getSelections");
	var length = selectRows.length,
		flag = true;
	$.messager.confirm("系统提示", "您确定要删除这条记录吗?", function(r) {
	if(length<1){
		flag = false;
		$.messager.alert("系统提示", "您未选择内容");
	}else if(length==1){
		accountList = selectRows[0].account;
	}else{
		for(var i=0;i<length;i++){
			accountList+=selectRows[i].account+",";
		}
	}
	if(flag){
		$.ajax({
			type:"post",
			url:"UserDeleteServlet",
			data:{
				"accountList":accountList,
			},
			success:function(result){  
				var rs = $.parseJSON(result);
				if(rs.success){
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示", "对不起，删除失败");
				}
			}
		}); 
	}
	});
}



