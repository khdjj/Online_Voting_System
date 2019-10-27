<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>在线投票系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/font-awesome-4.7.0/css/font-awesome.css" />
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
	<!-- nav -->
	<div class="navbar navbar-minimal">
		<div class="navbar-bd">
			<div class="container">
				<a href="/" class="navbar-brand-minimal"></a>
				<ul class="navbar-navigation">
					<li class="active"><a href="index.jsp" class="nava">首页</a></li>
					<li data-dmhottag-type="tab"><a href="vote_power?type=font"
						class="nava">文字投票</a></li>
					<li data-dmhottag-type="tab"><a href="vote_power?type=img"
						class="nava">图片投票</a></li>
					<li data-dmhottag-type="tab"><a href="v1_user" class="nava">我的</a>
					</li>
				</ul>
				<ul class="navbar-panel">
					<li class="panel-contact _js_contact400" style=""><a
						href="tel:400-810-8772" class="_js_serverphone">4000-870-888</a>
					</li>
					<li class="panel-action"><c:if test="${empty userId}">
							<ul class="f-cb" id="nav_action">
								<li class="login"><a class="btn btn-default btn-login"
									href="javascript:;" id="loginBtn" data-dmhottag="login"
									data-dmhottag-type="header"> 登录 </a>
								</li>
								<li><a class="btn btn-primary btn-register"
									href="register.jsp" rel="nofollow" id="regBtn"
									data-dmhottag="register" data-dmhottag-type="header">注册</a>
								</li>
								<li>
									<div class="case case-make  case-make-first">
										<div class="case-filter-item">
											<div class="column">
												<a href="javascript:;" data-currentcat="" data-cat=""
													class="case-filter-title">立即制作</a>
												<ul class="case-filter-dropdown">
													<li><a href="javascript:void(0)" data-thesubcat=""
														data-cat="0">图文投票</a></li>
													<li><a href="javascript:void(0)" data-thesubcat=""
														data-cat="1">音乐投票</a></li>
													<li><a href="javascript:void(0)" data-thesubcat=""
														data-cat="2">视频投票</a></li>
												</ul>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</c:if> 
						<c:if test="${not empty userId }">
							<li class='login'><a href='#'
								class='btn btn-default btn-login' id='loginExam'>${userId }</a>
							</li>
							<li><a href='vote_font.jsp'
								class='btn btn-primary btn-register' title='发起投票'>发起投票</a>
							</li>
						</c:if>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="layui-layer-shade" id="layui-layer-shade1" times="1"
		style="z-index:1000; display: none; background-color:#000; opacity:0.8; filter:alpha(opacity=80);"></div>
	<!-- 登录窗口 -->
	<div id="login_windows" style="display: none;">
		<div class="form-box">
			<span class="closeBtn">X</span>
			<ul class="form-login">
				<li><i class="fa fa-mobile fa-3x"></i> <input id="phone"
					type="text" class="input" name="username" tabindex="1"
					autocomplete="off" placeholder="请您输入手机号或用户名">
				</li>
				<li><i class="fa fa-key fa-3x"></i> <input type="password"
					id="password" class="input" name="password" tabindex="2"
					autocomplete="off" placeholder="请输入您的密码">
				</li>
				<li class="form-item form-item-authcode"><input type="text"
					class="field form-authcode input" placeholder="请输入验证码"
					maxlength="6"
					style="color:black;width:232px;float:left;margin:0px 0px;"
					name="verify" id="verify"> <img class="verify_img img-code"
					height="52" width="134" id="verify_img" src=""
					style="float:right;cursor:pointer;border:1px solid #CCC;"
					title="点击获取"></li>
				<li class="remember"><input type="checkbox" id="checkbox1"
					checked=""><label for="checkbox1">记住用户名</label></li>
				<li><span class="btn" typeof="submit" id="submit">登录</span>
				</li>
				<li class="link"><a onclick="findpassd()" href="javascript:;">忘记密码？</a>
					<span>还没有账号，<a href="javascript:;" onclick="register()">立即注册</a>
				</span>
				</li>
			</ul>
		</div>
	</div>

	<!-- 中间图片 -->
	<div id="nav_img">
		<img src="QJ6364371655.png">
	</div>

	<!-- 主体部分 -->

	<div id="votemaster_Html"
		class="votemaster_Html waterfall-container f-cb"
		style="position: relative;">
		<c:if test="${empty sessionScope.voteFont}">
			<c:redirect url="vote_getVoteFont" />
		</c:if>
		<c:forEach items="${sessionScope.voteFont}" var="vote" varStatus="v">
			<div class="fall_item card_item" data-question="27416"
				data-category="3" data-title="${vote.title }">
				<c:if test="${empty vote.singleEle }">
					<div class="card_row1" style="background-color:#e714ec">
						<table>
							<tbody>
								<tr>
									<td>多选</td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:if>
				<c:if test="${empty vote.multipleEle }">
					<div class="card_row1" style="background-color:#a5c31d">
						<table>
							<tbody>
								<tr>
									<td>单选</td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:if>
				<div class="card_row2">
					<a href="/vote_toUsersVote?targetUserID=6074612d629f5688"
						target="_blank" class="A" title="yssss"><img width="36"
						height="36"
						src="http://www.wanyan.com/votepointimg/2015/8/1438846137971_1.png">
					</a> <a href="/vote/toUsersVote?targetUserID=6074612d629f5688"
						target="_blank" class="B" title="${vote.userId }">${vote.userId
						}</a>
					<p class="C">${vote.time}</p>
				</div>
				<h2 class="card_row3">
					<a href="javascript:void(0);" name="layer_butt"
						title="${vote.title }">${vote.title }</a>
				</h2>
				<div class="card_row4">
					<a href="javascript:void(0);" name="layer_butt">${vote.desc }</a>
				</div>
				<div class="card_row5">
					<a href="javascript:void(0);" name="layer_butt">
					<c:choose>
						<c:when test="${not empty vote.imgUrl }">
							<img src="${vote.imgUrl }"> 
						</c:when>
						<c:otherwise>
							<img src="http://pic3.nipic.com/20090717/1111389_190943091_2.jpg"> 
						</c:otherwise>
					</c:choose>
					</a>
				</div>
				<div class="card_row6X">
					<div class="A myStathalf circliful" data-dimension="72"
						data-text="${(voteOpt.get(v.index).num/vote.votes_num)*100}%"
						data-width="7" data-fontsize="16"
						data-percent="${(voteOpt.get(v.index).num/vote.votes_num)*100 }"
						data-fgcolor="#a5c31d" data-bgcolor="#fff" data-txtcolor="#a5c31d"
						style="width: 72px;"></div>
					<table>
						<tbody>
							<tr>
								<td>
									<p class="B">选择了</p>
									<p class="C">${voteOpt.get(v.index).options}</p>
								</td>
							</tr>
							<tr></tr>
						</tbody>
					</table>
				</div>
				<div class="card_row9">
					<a href="/webapp/app/wanyan/votemaster.html?by=13&amp;category=305">${vote.classify
						}</a>
				</div>
				<div class="card_row10">
					<a href="javascript:void(0);" name="layer_butt" title="浏览数"
						class="A">${vote.visits_num }</a> <a href="javascript:void(0);"
						name="layer_butt" title="评论数" class="B">${vote.comment }</a> <span
						class="C">${vote.votes_num }</span>
				</div>
				<div class="card_row11" data-bgcolor="#a5c31d"
					style="background-color: rgb(249, 249, 249);">
					<a
						href="vote_getVoteAction?vote_id=${vote.voteId}&options_id=${vote.optionsId}&vote_index=${v.index}&type=${vote.type}"
						name="layer_butt" title="公众场合听到很搞笑的笑话，你会怎么笑呢？" class="BX"
						style="color: rgb(153, 153, 153);">查看数据</a>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class ="pagation" style= "text-align: center;">
		<a href="vote_getVoteFont?page=${page-count}">上一页</a>
		<a href="vote_getVoteFont?page=${page+count}">下一页</a>
	</div>

	<footer> 此为学习所用，若涉及侵权，请联系2994230021@qq.com,我将立即删除 </footer>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/c.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/core.js"></script>

</body>
</html>

