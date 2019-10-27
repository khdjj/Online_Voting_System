<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>我的</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/my.css" />
<style>
	.alert{
		display:none;
		position:absolute;
		top:30%;
		left:40%;
		color:white;
		padding:10px;
		z-index:99999999999;
		background-color:black;
		border-radius:10px;
}
</style>
</head>
<body>
	<span class="alert"></span>
	<input type="hidden" class ="err" value="${err}"/>
	<div id="Header_Control">
		<div class="header_OneLevel">
			<div class="OneLevel_Left"></div>
		</div>
		<div class="Navigation_Control">
			<div class="Navigation_Middle">
				<p class="Nav_Img">
					<img id="WY_head" src="http://www.wanyan.com/images/m_head.png">
				</p>
				<p class="Nav_Name">
					<span id="WY_name">${userId}</span><a id="WY_member"
						href="javascript:void(0);" class="v1">认证会员</a>
				</p>
				<p class="Nav_href">
					<a href="/vote/created" id="fixed_faqi" class="hover"><span
						id="WY_faqi">${UserVote.size()}</span>发起</a> <a href="/vote/join" id="fixed_canyu"><span
						id="WY_canyu">2</span>参与</a> <a href="/vote/shoucang"
						id="fixed_shoucang"><span id="WY_shoucang">0</span>收藏</a> <a
						href="/vote/zhuanfa" id="fixed_zhuanfa"><span id="WY_zhuanfa">0</span>转发</a>
					<a href="/webapp/app/wanyan/recommend.html"><span
						style="font-size: 14px; line-height: 24px;">投票<br>首页</span>
					</a>
				</p>
			</div>
		</div>
	</div>
	<div class="Selection_Conditions">
		<div class="SC_Upp" id="SC_Upp">
			<p class="SC_Genre" id="SC_Genre">
				<a href="javascript:void(0);" class="Big_Son">投票<br>类型</a> <a
					href="javascript:void(0);" data-index="0" class="Small_Son">文字投票</a>
				<a href="javascript:void(0);" data-index="1" class="Small_Son">图片投票</a>
				<a href="javascript:void(0);" data-index="2" class="Small_Son">视频投票</a>
			</p>
		</div>
		<div class="SC_Low">
			<p class="SC_Screening">
				<a href="javascript:void(0);" class="orderA" id="Order_More">更多筛选</a>
				<a href="javascript:void(0);" class="orderB" id="Order_Close">已关闭投票</a>
				<a href="javascript:void(0);" class="orderB" id="Order_guandian">对应观点</a>
				<a href="javascript:void(0);" class="orderC orderCs"
					id="Order_Amount">投票数</a> <a href="javascript:void(0);"
					class="orderC" id="Order_Time" title="发起时间从新到旧">发起时间</a>
			</p>
			<p class="SC_Sorting" id="SC_Sorting">
				<a class="output" style="">导出</a>
				<!-- <a href="javascript:void(0);" class="SelectAll" id="SelectAll">全选</a>
				<a href="javascript:void(0);" class="DeleSele" id="DeleSele">删除</a> -->
				<a href="javascript:void(0);" class="NextPage" id="NextPage">下一页</a>
				<a href="javascript:void(0);" class="LastPage PageDefault"
					id="LastPage">上一页</a>
			</p>
			<div class="SC_Classify" id="SC_Classify">
				<div class="Classify_Upp" id="Classify_Upp">更多筛选</div>
				<div class="Classify_Low">
					<p>
						<span class="spanA">投票分类：</span> <select id="Frame_Type">
							<option value="" selected="">全部</option>
						<span class="spanC">投票标题：</span> <input id="Frame_Title"
							type="text" value="" placeholder="请输入关键字或昵称"> <a
							href="javascript:void(0);" id="Frame_Search">搜索</a> 
					</p>
				</div>
				<a href="javascript:void(0);" class="Classify_Close"
					id="Classify_Close"><img
					src="http://www.wanyan.com/webapp/css/myvote/img/content/orderE.png">
				</a>
			</div>
		</div>
	</div>
	<div class="Vote_Item">
		<div class="Item_header">
			<span class="s1">投票内容</span> <span class="s2">投票数</span> <span
				class="s3">投票推广</span> <span class="s4">投票分析</span> <span class="s5">投票设置</span>
			<span class="s6">删除</span>
		</div>
		<div class="Item_Emerge" id="Item_Emerge" data-show="">
		<c:if test="${empty UserVote}">
			<p class="Emerge_Nodata">暂无数据</p>
		</c:if>
		<c:forEach items="${UserVote }" var = "v">
			<table class="Emerge_Single" border="0">
					<tbody>
						<tr class="tr_2" style="display: table-row;">
							<td class="Single_Guide1">
								<a class="Guide1_row1" data-id="27418" href="javascript:void(0);"></a>
								<img class="Guide1_row2" src="http://www.wanyan.com/webapp/css/myvote/img/content/style1.png" title="文字投票" alt="文字投票">
								<span class="Guide1_row3" title="${v.title }">${v.title }</span>
								
								<span class="Guide1_row7">发起人：<a href="/vote/toUsersVote?targetUserID=6074612d629f5688" target="_blank">${v.userId }</a></span>
							</td>
							<td class="Single_Guide2">
								<p class="Guide2_row1">${v.votes_num }</p>
							</td>
							<td class="Single_Guide3">
								<p class="Guide3_row1 Dynamic_Shouyan">

								</p>
							</td>
							<td class="Single_Guide4">
								<a class="Guide4_row1 voteAnalysis" data-id="${v.voteId }" href="javascript:void(0);">数据分析</a>
							</td>
							<td class="Single_Guide5">
								<div class="Setup_Host"><a style="color: #bbb;margin-left: 44px;"  class = "modify" title="修改"  href="${pageContext.request.contextPath }/vote_isModify?voteId=${v.voteId}">修改</a></div>
							</td>
							<td class="Single_Guide6">
								<span class="Guide6_row2 delete" data-vid = "${v.voteId }">删除</span>
							</td>
						</tr>
					</tbody>
				</table>
				</c:forEach>
		</div>
		<div id="Item_Paging" class="Item_Paging">
			<a href="javascript:void(0);" paged="1">首页</a><a
				href="javascript:void(0);" paged="-1">上一页 </a><span class="disabled"
				paged="下一页">下一页 </span><a href="javascript:void(0);" paged="0">尾页</a>
		</div>
	</div>
	<div id="data_analysis">
			<div style="position:relative">
				<span id="close_data_analysis">
					X
				</span>
				<div class="skip-data-type">
					<a href="javascript:void(0)" class="CrossHover1 crossHover CrossHover1s" data-hover="CrossHover1s">性别</a>
					<a href="javascript:void(0)" class="CrossHover2 crossHover" data-hover="CrossHover2s">年龄</a>
					<a href="javascript:void(0)" class="CrossHover3 crossHover" data-hover="CrossHover3s">城市级别</a>
				</div>
			</div>
			<div class="data_show" style="position:relative" >
				<ul>
					<li id="vDataAnalysis1" class="item-data-content"></li>
					<li id="vDataAnalysis2" class="item-data-content" style="display: none;"></li>
					<li id="vDataAnalysis3" class="item-data-content" style="display: none;"></li>
				</ul>
			</div>
		</div>
		<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/Highcharts-7.1.2/code/highcharts-3d.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/Highcharts-7.1.2/code/highcharts-3d.src.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/Highcharts-7.1.2/code/highcharts-more.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/Highcharts-7.1.2/code/highcharts.js"></script>
	<script src="${pageContext.request.contextPath }/js/core.js"></script>
</body>
</html>

