<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>发起投票</title>
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/vote.css" />
		<link rel="stylesheet" type="text/css" href="js/Timer/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="js/Timer/dist/flatpickr.min.css" />
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
		
		
		<div class="App_Home clearfix">
			<div class="initiates">
				<div class="userleft" style="height: 846px;">
					<div class="userbox">
						<div class="userhead">
							<div class="userimg">
								<img id="userImg" src="http://p2.music.126.net/VnZiScyynLG7atLIZ2YPkw==/18686200114669622.jpg?param=180y180">
							</div>
							<div class="username" id="username">wy6052pwyo</div>
						</div>
						<div class="intext">
							累计发起投票: <span class="userfred f14" id="userfred">0</span> 次
						</div>
						<div class="intext">
							今天还可以发起: <span class="userfred f14" id="publishNum">5</span> 个投票
						</div>
					</div>
					<div class="Editor_Launch">
						<div class="EL_Html">
							<a href="/vote/toSingleVote" class="row1">编辑投票</a>
							<a href="/vote/created" class="row2">我发起的</a>
						</div>
					</div>
				</div>
				<div class="iateright">
					<div class="pvote_area">
						<div class="sa_head f-cb">
							<div class="sa_head_left">
								<div class="cretips">
									<div class="cretip1">你想要的观点，请大家来投给你... ...</div>
									<div class="cretip2">立即发起你的投票吧!每天发起投票不能超过5个哦！</div>
								</div>
								<img src="http://www.wanyan.com/images/vote/sa_tip1.jpg">
							</div>
							<div class="sa_head_right">
								<div class="sa_head_btok"><a href="javascript:;">创建投票</a></div>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="sa_selects" style="display: none;">
							<div class="sa_select_area">
								<div class="sa_select_list">
									<ul>
										<li class="items eq1">
											<p class="saseltip">请选择</p>
											<p>投票类型</p>
										</li>
										<li class="items gap1"></li>
										<li class="items">
											<div val="0" class="sa_select_info">
												<div class="sa_select_img_font"></div>
												<div class="sa_select_img_tip">文字投票</div>
											</div>
										</li>
										<li class="items gap2"></li>
										<li class="items">
											<div val="1" class="Img_select_info">
												<div class="sa_select_img"></div>
												<div class="sa_select_img_tip">图片投票</div>
											</div>
										</li>
										<li class="items">
											<div val="1" class="Img_select_info">
												<div class="sa_select_img_video"></div>
												<div class="sa_select_img_tip">图片投票</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<div class="sa_tip_area">
								<img src="http://www.wanyan.com/images/vote/sa_tip2.jpg">
							</div>
						</div>
						<div class="sponsor_area_box" style="">
							<div class="sponsorbox">
								<div class="sponsor_close" style="left: 946px; top: 268px; display: block;">
									<a href="javascript:;" class="word_type" title="文字投票" style="display: inline;"></a>
									<a href="javascript:;" class="img_type" title="图片投票" style="display: none;"></a>
									<a href="javascript:;" class="video_type" title="视频投票" style="display: none;"></a>
								</div>
								<div class="sb_title">
									<input type="text" value="" placeholder="点击此处添加投票标题" class="sp_txttitle" maxlength="20" style="border: 1px dashed rgb(255, 0, 0); color: rgb(255, 0, 0);">
								</div>
								<div class="sp_keys_area ui-sortable" style="display: block;">
									<ul class="options_ul">
										<li class="keitems"><input type="text" placeholder="点击此处添加选项" class="ksystext" maxlength="24">
											<a class="keysadd"></a><a class="keyssub"></a></li>
										<li class="keitems" style=""><input type="text" placeholder="点击此处添加选项" class="ksystext" maxlength="24">
											<a class="keysadd"></a><a class="keyssub"></a></li>
									</ul>
									<ul>
										<li class="keytip" style="display: list-item;">不能有相同选项</li>
									</ul>
								</div>
								<div class="sp_img_area" style="display: block;">
									<div class="img_infos">
										<div class="img_show"><img width="100%" height="100%" src="#"  class="show_upload_img" style="display: none;">
											<input type = "file" class="upload_file"/>
										</div>
										<div class="img_upp"><img src="http://www.wanyan.com/images/app/Unified_ico8.png"></div>
									</div>
									<div class="sp_explain_area">
										<div class="sp_explain_text">
											<textarea rows="" class="desc" cols="" maxlength="200" placeholder="关于此投票，你想说点啥..."></textarea>
										</div>
									</div>
									<div class="sp_class_area f-cb">
									<div class=""
										style="display: block;float: left;margin-top: 10px;margin-bottom: 7px;">
										<label><input type="radio" value="单选" name="select"/>单选</label> <label><input
											type="radio" value="多选"  name="select"/>多选</label>
											<div class="sp_class_right" style="margin-left: 110px;margin-top: 0;">选择分类
												
											</div>
										<div class="clearfix"></div>
									</div>
									<div class="sp_time_area f-cb">
										<div class="sp_time_setup"><span class="sp_time_tip">截止时间：</span>
											<div class="setup_rowtxt">
												<input class='flatpickr' data-enable-time='true'>
											</div>
										</div>
									</div>
									<div class="sp_visual_area"><span class="sp_time_tip">投票可见：</span>
										<div class="mui-input-row mui-checkbox ">
											<label> <input name="Checkbox" type="radio" value="全部可见">
												全部可见
											</label>
										</div>
										<div class="mui-input-row mui-checkbox ">
											<label> <input name="Checkbox" type="radio" value="互相关注">
												互相关注
											</label>
										</div>
										<div class="mui-input-row mui-checkbox ">
											<label> <input name="Checkbox" type="radio" value="指定好友">
												指定好友
											</label>
										</div>
										
									</div>
									<div class="sp_dict_area"><span class="sp_time_tip">关键字：</span> <input type="text" maxlength="126" class="sp_dict_txt">
										<p class="sp_dict_tip">多个关键字请用半角“,”分开</p>
										<div class="clearfix"></div>
									</div>
									<div class="sp_submint_area"><input type="button" value="完成" class="sp_complate"></div>
								</div>
							</div>
							<div class="tiplist">
								<div class="tip_type" style="left: 974px; top: 274px; display: block;"><img src="http://www.wanyan.com/images/vote/sptep_tip_type.jpg"></div>
								<div class="tiptwo" style="left: 446.063px; top: 644px; display: block;"><img src="http://www.wanyan.com/images/vote/sptep2.jpg"></div>
								<div class="tipthree" style="left: 942px; top: 354px; display: block;"><img src="http://www.wanyan.com/images/vote/sptep3.jpg"></div>
								<div class="tipfour" style="left: 945.063px; top: 664px; display: block;"><img src="http://www.wanyan.com/images/vote/sptep4.jpg"></div>
								<div class="tipfive" style="left: 945.063px; top: 750px; display: block;"><img src="http://www.wanyan.com/images/vote/sptep5.jpg"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="Fillet_Style tyle_floating_layer" id="tyle_floating_layer" style="left: 409.5px; top: 162.5px; display:none">
        <p class="clearfix A f-cb">
            <a data-item="101" title="服装饰品" href="javascript:;">服装饰品</a>
            <a data-item="102" title="餐饮美食" href="javascript:;">餐饮美食</a>
            <a data-item="103" title="住房家居" href="javascript:;">住房家居</a>
            <a data-item="104" title="出行交通" href="javascript:;">出行交通</a>
            <a data-item="105" title="网络生活" href="javascript:;">网络生活</a>
            <a data-item="106" title="汽车生活" href="javascript:;">汽车生活</a>
            <a data-item="107" title="健康生活" href="javascript:;">健康生活</a>
            <a data-item="108" title="手机数码" href="javascript:;">手机数码</a>
            <a data-item="109" title="美容化妆" href="javascript:;">美容化妆</a>
            <a data-item="110" title="亲子育儿" href="javascript:;">亲子育儿</a>
            <a data-item="111" title="家用电器" href="javascript:;">家用电器</a>
            <a data-item="112" title="宠物花鸟" href="javascript:;">宠物花鸟</a>
        </p>
        <p class="clearfix B f-cb">
            <a data-item="201" title="金融理财" href="javascript:;">金融理财</a>
            <a data-item="202" title="商业服务" href="javascript:;">商业服务</a>
            <a data-item="203" title="教育培训" href="javascript:;">教育培训</a>
            <a data-item="204" title="求职就业" href="javascript:;">求职就业</a>
            <a data-item="205" title="医疗保障" href="javascript:;">医疗保障</a>
            <a data-item="206" title="全球视野" href="javascript:;">全球视野</a>
        </p>
        <p class="clearfix C f-cb">
            <a data-item="301" title="图书音像" href="javascript:;">图书音像</a>
            <a data-item="302" title="旅游休闲" href="javascript:;">旅游休闲</a>
            <a data-item="303" title="体育娱乐" href="javascript:;">体育娱乐</a>
            <a data-item="304" title="游戏动漫" href="javascript:;">游戏动漫</a>
            <a data-item="305" title="开心搞笑" href="javascript:;">开心搞笑</a>
            <a data-item="306" title="两性生活" href="javascript:;">两性生活</a>
        </p>
        <p class="close_tyle"><img src="http://www.wanyan.com/webapp/css/publish/img/x19.png"></p>
    </div>
		<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
		<script src="js/core.js"></script>
		<script type="text/javascript" src="js/Timer/dist/flatpickr.js"></script>
		<script type="text/javascript">
			$('.flatpickr').flatpickr();
		</script>
	</body>
</html>

