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
<title>图片投票</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/register.css">
<link rel="stylesheet" type="text/css"
	href="http://www.wanyan.com/webapp/css/viewpoint/resources/viewpoint.min.css">
<link rel="stylesheet" type="text/css" href="css/vote_font_action.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/style.css">
<style type="text/css">
.img_show {
	width: 242px;
	height: 266px;
	float: left;
	margin: 26px;
	position: relative
}

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

.f-cb::after {
	clear: both;
	content: '.';
	display: block;
	height: 0;
	visibility: hidden;
}

.container {
	position: relative;
}

.close_img_show {
	z-index: 99999;
	position: absolute;
	font-size: 19px;
	right: 0px;
	cursor: pointer;
	border: 1px solid #db2c3e;
	border-radius: 50%;
	width: 27px;
	color: #aba06d;
	text-align: center;
}

.img_show img {
	width: 100%;
	height: 71%;
	cursor: pointer;
}

.vote_rs {
	position: relative;
}


a {
	text-decoration: none;
}

.time_hint {
	width: 25%;
	float: right;
	height: 317px;
	background: #f5f4f4;
}

.end_title {
	display: inline-block;
	text-align: center;
	padding: 10px;
	color: #ea2525;
	font-weight: bold;
}

.timer {
	text-align: center;
	margin: 30px auto 0;
	padding: 0 0 10px;
	border-bottom: 2px solid #80a3ca;
}

.timer .table-cell {
	display: inline-block;
	margin: 0 5px;
	width: 79px;
	background: url(./images/timer.png) no-repeat 0 0;
}

.timer .table-cell .tab-val {
	font-size: 35px;
	color: #80a3ca;
	height: 81px;
	line-height: 81px;
	margin: 0 0 5px;
}

.timer .table-cell .tab-metr {
	font-family: Arial;
	font-size: 12px;
	text-transform: uppercase;
}

#simple_timer.timer .table-cell.day,#periodic_timer_days.timer .table-cell.hour
	{
	width: 120px;
	background-image: url(./images/timer_long.png);
}

.vote_action {
	text-align: center;
	width: 126px;
	display: inline-block;
	background-color: #ea7e37;
	color: #fff;
	height: 29px;
	margin-bottom: 10px;
	border-radius: 10px;
	margin-top: 10px;
	line-height: 29px;
	cursor: pointer;
}

.vote_rs {
	display: inline-block;
	width: 50%;
	height: 30px;
	background: #ece2e2;
	margin-left: 32px;
	height: 10px;
	border-radius: 10px;
}

.vote_num {
	margin-left: 48px;
}

.img-items img {
	width: 100%;
	height: 100%;
}

#reviewPart {
	margin-top: 76px;
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
					<li class="active"><a href="/" class="nava">首页</a></li>
					<li data-dmhottag-type="tab"><a href="vote_power?type=font"
						class="nava">文字投票</a></li>
					<li data-dmhottag-type="tab"><a href="vote_power?type=img"
						class="nava">图片投票</a></li>
					<li data-dmhottag-type="tab"><a href="my.jsp" class="nava">我的</a>
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
											<span class="list-p-actor">编辑: ${voteAction.userId }</span> <span
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
									<input type="hidden" value="${voteAction.voteId}"
										class="voteId" />
									<div class="list-top-c ">
										<c:forEach items="${sessionScope.options}" var="opt">
											<div class="img_show vote_opt">
												<span class="vote_pro" style="display:none"
													data-vote="${opt.num/voteAction.votes_num*100}"></span>
												<h3 class="options" style="display:none">${opt.options}</h3>
												<img src="${opt.img }"> <span class="vote_rs"><span
													class="vote_pro"
													data-vote="${opt.num/voteAction.votes_num*100}"></span> </span>
												<c:if test="${show}">
													<span class="vote_num">${opt.num }票</span>
												</c:if>
												<input type="hidden" value="${opt.optionsId }"
													class="options_id" /> <span class="vote_action">投票</span>
											</div>
										</c:forEach>

									</div>
								</div>





								<div class="container" style="display: none;">
									<span class="close_img_show">X</span>
									<div class="slider-wrap f-cb" style="position: relative;">
										<div class="prev-btn btn" style="top: 203px;position: absolute;cursor: pointer;left: 0;z-index: 99999999;">
											<img src="btn_l.png">
										</div>
										<ul class="slider">
											<c:forEach items="${sessionScope.options}" var="opt">
												<li class="img-items"><img src="${opt.img }"></li>
											</c:forEach>
										</ul>
										<div class="next-btn btn" style="top: 200px;position: absolute;right: 0;cursor: pointer;z-index: 99999999;">
											<img src="btn_r.png">
										</div>
										<div class="pagination-wrap">
											<ul></ul>
										</div>
									</div>
								</div>



							</div>
						</div>



						<div class="item-data-content" id="vDataAnalysisDouble"
							style="display:none; margin-top:30px"></div>

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

										<img width="50" height="50"
											src="http://www.wanyan.com/images/m_head.png">

									</div>
									<div class="SR_InpBox" data-byid="0">
										<textarea cols="10" class="SR_Box" placeholder="发表你的看法"></textarea>
										<a href="javascript:void(0);" class="SR_Submit">评论</a>
									</div>
								</div>
							</div>

							<div class="Review_Frames" id="Review_Frames">
								<c:forEach items="${comment}" var="c">
									<div class="Review_Item">
										<div class="Review_Left Evaluation_Info" data-member="0"
											data-id="e4a14f86cd326bd5" data-img="/images/m_head.png"
											data-url="/vote/toUsersVote?targetUserID=e4a14f86cd326bd5"
											data-name="aimeiliew">
											<a href="/vote/toUsersVote?targetUserID=e4a14f86cd326bd5"
												target="_blank"><img
												src="http://www.wanyan.com/images/m_head.png"> </a>
										</div>
										<div class="Review_Right">
											<div class="Review_one_level">
												<p class="row1">
													<a href="" class="username" target="_blank"
														style="display:none">${c.commentId }</a> <a href=""
														class="" target="_blank">${c.userId }</a><span>${c.time}</span>
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
												<c:set var="quote" value="${c.quocom}" />
												<c:forEach items="${quote}" var="q">
													<div class="replycontent">
														<p class="row1">
															<a href="/vote/toUsersVote?targetUserID=037b29120cd9d944"><img
																width="100%" height="100%"
																src="http://www.wanyan.com/images/m_head.png"> </a>
														</p>
														<div class="row2">
															<p class="col1">
																<a
																	href="/vote/toUsersVote?targetUserID=037b29120cd9d944"
																	target="_blank">${q.userId }</a> <span>${q.time
																	}</span>
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
		</div>
	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/Shuffling.js"></script>
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
	<script>
		$(".img_show img").click(function() {

			$('.container').css({
				display : "block"
			})
			var setting = {
				model : "carousel", //slide or carousel
				delay : 1000, //延迟
				posterWidth : 640, //此为幻灯片模式情况下第一帧的宽度
				posterHeight : 400, //此为幻灯片模式情况下第一帧的高度
				width : 1000, //在普通轮播模式下,width为第一张图片的宽度,幻灯片模式下,width为整个显示轮播特效的总宽度,高度也是如此
				height : 400,
				autoPlay : true, //自动播放
				scale : 0.8, //carousel模式下图片的缩放比例
				paginationModel : "square" // circular or square
			}

			Shuffling.init($(".slider-wrap"), setting);
		})

		$(".close_img_show").click(function() {
			Shuffling.destory();
			$('.container').css({
				display : "none"
			})
		})
	</script>


</body>
</html>
