<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >
<html >
	<head >
		<meta charset="utf-8"/>
		<title>投票后台管理页</title>
		<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css" />
		<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css" />
		<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
		<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
		<script type="text/javascript" src='js/behind_Platform.js'> </script>
		<link href="css/behind_Platform.css" rel="stylesheet" type="text/css" />
		
		
		<script type="text/javascript">
			var _menus = {
				"menus": [{
					"menuid": "1",
					"icon": "icon-userman",
					"menuname": "用户管理",
					"menus": [
						{
							"menuid": "13",
							"menuname": "网站用户",
							"icon": "icon-user",
							"url": "user_Mana.jsp"
						},
						{
							"menuid": "14",
							"menuname": "设计师",
							"icon": "icon-designer",
							"url": "designer_Mana.jsp"
						},
					]
				}, {
					"menuid": "8",
					"icon": "icon-data",
					"menuname": "数据管理",
					"menus": [{
							"menuid": "21",
							"menuname": "需求管理",
							"icon": "icon-require",
							"url": "RequireMana.jsp"
						},
						{
							"menuid": "22",
							"menuname": "订单管理",
							"icon": "icon-order",
							"url": "Order_Mana.jsp"
						},
						{
							"menuid": "23",
							"menuname": "退款管理",
							"icon": "icon-refund",
							"url": "refund_Mana.jsp"
						}
					]
				}, {
					"menuid": "56",
					"icon": "icon-lanmu",
					"menuname": "栏目管理",
					"menus": [{
							"menuid": "31",
							"menuname": "原创文章",
							"icon": "icon-wenzhang",
							"url": "article_Mana.jsp"
						}
					]
				}, {
					"menuid": "28",
					"icon": "icon-sys",
					"menuname": "系统统计",
					"menus": [{
							"menuid": "41",
							"menuname": "网站访问量",
							"icon": "icon-visited",
							"url": "visitorCounter.jsp"
						}
					]
				}]
			};	
		</script>

	</head>
	<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
		<noscript>
			<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
				<img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
			</div>
		</noscript>
		<div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
			<div class="footer">版权归吉首大学软件学院所有</div>
		</div>
		<div region="west" hide="true" split="true" title="导航菜单" style="width:180px;" id="west">
			<div id="nav" class="easyui-accordion" fit="true" border="false">
				<!--  导航内容 -->

			</div>

		</div>
		<div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
			<div id="tabs" class="easyui-tabs" fit="true" border="false">
				
			</div>
		</div>
		<div id="mm" class="easyui-menu" style="width:150px;">
			<div id="mm-tabupdate">刷新</div>
			<div class="menu-sep"></div>
			<div id="mm-tabclose">关闭</div>
			<div id="mm-tabcloseall">全部关闭</div>
			<div id="mm-tabcloseother">除此之外全部关闭</div>
			<div class="menu-sep"></div>
			<div id="mm-tabcloseright">当前页右侧全部关闭</div>
			<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
			<div class="menu-sep"></div>
			<div id="mm-exit">退出</div>
		</div>
	</body>
</html>

