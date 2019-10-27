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
<title>欢迎投票</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/register.css">
<link rel="stylesheet" type="text/css"
	href="http://www.wanyan.com/webapp/css/viewpoint/resources/viewpoint.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/vote_font_action.css"/>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/style.css">
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
	<input type="hidden" class="show" value="${show}">
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
	<div class="view-content">
		<div class="view-item-content five-h-vote">
			<div class="view-report-content" pointid="10023" pointtype="0">
				<div class="pic-report-list fl">
					<div class="h-v-list">
						<div class="v-list" id="vote-date-item">
							<div class="v-list-1">
								<div id="viewDescript">
									<div class="v-list-info rel">

										<i class="list-info-type info-type4 view-icon">${voteAction.votes_num}票</i>

										<p class="list-info-title f18">${voteAction.title }</p>
										<p class="list-info-tip f12 grey-text">
											编辑:<span class="list-p-actor"> ${voteAction.userId }</span> <span
												class="list-p-time">${voteAction.time }</span>
										</p>
										<p class="vote-c-c f12">

											<span class="v-vote-count"> <a
												href="${path}/vote/176434873-1.html" target="_blank"
												class="f18 green-text">${voteAction.votes_num}</a> <br>
												票数 </span> <span class="v-comment-count"> <a
												href="#reviewPart" class="f18 red-text">${voteAction.comment
													}</a> <br> 评论 </span>
										</p>
									</div>
									<div class="list-top-c">
										<div class="v-report-img fl">
											<a href="" title=""> <img width="260" height="146"
												src="${pageContext.request.contextPath}/${voteAction.imgUrl }"
												alt=""> </a>
										</div>
										<div class="v-report-theme fr">
											<p class="list-top-detail f14 ttt-text rel">
												<i class="q-mark q-mark-1 view-icon"></i> <i
													class="q-mark q-mark-2 view-icon"></i> ${voteAction.desc }
											</p>
										</div>
										<div class="cboth"></div>
									</div>
								</div>
								<input type="hidden" value="${voteAction.voteId}" class="voteId" />
								<ul class="view-item-data" id="vAnaData">
									<li class="item-data-detail">
										<h3 class="data-list-title">${voteAction.title }</h3>
										<div class="item-data-content" id="vDataAnalysis1"
											style=" text-align: left;">
											<c:forEach items="${sessionScope.options}" var="opt">
												
												<div style="border-bottom: 1px dashed #dabbde;height: 58px;"
													class="vote_opt">
													<input type="hidden" value="${opt.optionsId }"
													class="options_id" />
													<h3 class="options">${opt.options }</h3>
													<span class="vote_rs"><span class="vote_pro"
														data-vote="${opt.num/voteAction.votes_num*100}"></span> </span>
													<c:if test="${show}">
														<span class="vote_num">${opt.num }票</span>
													</c:if>
													<c:choose>
													<c:when test="${empty voteAction.multipleEle }">
														<span class="vote_action">投票</span>
													</c:when>
													<c:otherwise>
														<input type="checkbox" name="addoptions" value="${opt.options}" />
													</c:otherwise>
													</c:choose>
												</div>
											</c:forEach>
									
										</div>
										<div class="item-data-content" id="vDataAnalysisDouble"
											style="display:none;"></div>
									</li>
								</ul>
								<c:if test="${not empty voteAction.multipleEle }">
									<p class="vote_action">投票</p>
								</c:if>

							</div>
						</div>
						<div></div>
						<div id="reviewPart">
							<div class="Review_Switching" id="Review_Switching">
								<a href="javascript:void(0)" data-by="1" data-type="0"
									class="Link_left hover" id="Review_link1"><strong>92</strong>条评论</a>
							</div>
							<div class="Submit_Review">
								<h2 class="SR_title">发表评论</h2>
								<div class="SR_Register" style="display: none;">
									<a href="/login/toLogin">万言帐号登录</a>
								</div>
								<div class="SR_Logout">
									<a href="javascript:void(0);">退出</a><span class="logout_userId">${userId
										}</span>
								</div>
								<div class="SR_Content">
									<div class="SR_HeadImg">

										<img width="50" height="50" src="http://www.wanyan.com/images/m_head.png">

									</div>
									<div class="SR_InpBox" data-byid="0">
										<textarea cols="10" class="SR_Box" placeholder="发表你的看法"></textarea>
										<a href="javascript:void(0);" class="SR_Submit">评论</a>
									</div>
								</div>
							</div>
							
							<div class="Review_Frames" id="Review_Frames">
							<c:forEach items="${comment}" var = "c">
								<div class="Review_Item">
									<div class="Review_Left Evaluation_Info" data-member="0"
										data-id="e4a14f86cd326bd5" data-img="/images/m_head.png"
										data-url="/vote/toUsersVote?targetUserID=e4a14f86cd326bd5"
										data-name="aimeiliew">
										<a href="/vote/toUsersVote?targetUserID=e4a14f86cd326bd5"
											target="_blank"><img src="http://www.wanyan.com/images/m_head.png"> </a>
									</div>
									<div class="Review_Right">
										<div class="Review_one_level">
											<p class="row1">
												<a href="" class="username" target="_blank" style="display:none">${c.commentId }</a>
												<a href="" class="" target="_blank">${c.userId }</a><span>${c.time}</span>
											</p>
											<p class="row2">${c.content }</p>

											<a class="row3 ReplyRe" data-byid="197481">回复</a>

											<div class="row3 reply" id="TwoSub_39646"
												style="display: block;">
												<p class="col1">
													<textarea rows="" cols="" placeholder="我来说点啥..."
														class="rep_area"></textarea>
												</p>
												<p class="col2">
													<a href="javascript:void(0);"
														class="A Fillet_Five butt_hover Review_click"
														data-commentsource="1" data-id="39646">评论</a>
												</p>
											</div>
											<c:set  var="quote" value="${c.quocom}"/>
											<c:forEach items="${quote}" var = "q">
											<div class="replycontent">
												<p class="row1">
													<a href="/vote/toUsersVote?targetUserID=037b29120cd9d944"><img
														width="100%" height="100%"
														src="http://www.wanyan.com/images/m_head.png">
													</a>
												</p>
												<div class="row2">
													<p class="col1">
														<a href="/vote/toUsersVote?targetUserID=037b29120cd9d944"
															target="_blank">${q.userId }</a> <span>${q.time }</span>
													</p>
													<p class="col2">${q.content}</p>
												</div>
											</div>
											</c:forEach>
										</div>

									</div>
								</div>
								</c:forEach>
								
							</div>
							
							<div id="myPaging">加载更多</div>
						</div>
					</div>
				</div>
				<div class="time_hint">

					<p class="end_title">投票结束时间</p>
					<span class="end_title"> ${voteAction.endTime} </span>
					<div id="simple_timer"></div>
				</div>
				<div class="cboth"></div>
			</div>
			<div class="cboth"></div>
		</div>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/jquery.syotimer.js"></script>

	<script type="text/javascript">
		var end_time = $('.end_title').text();
		var reg = /(\d{4})-(\d{2})-(\d{2})\s(\d{2}):(\d{2})/;
		var et = reg.exec(end_time);
		console.log(reg.exec(end_time));

		$('#simple_timer').syotimer({
			year : et[1],
			month : et[2],
			day : et[3],
			hour : et[4],
			minute : et[5],
		});
	</script>
</body>
</html>
