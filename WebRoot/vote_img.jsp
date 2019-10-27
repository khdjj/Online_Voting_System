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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/vote_img.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/Timer/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/Timer/dist/flatpickr.min.css" />
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

	<div class="Publish_Html">
		<div class="Publish_Left">
			<div class="Left_User_Info">
				<img class="A" width="80" height="80"
					src="http://www.wanyan.com/images/m_head.png" id="User_Info_header"
					title="wy6052pwyo"> <span class="B"><i
					id="User_Info_Meter">0</i><br>累计发起</span> <span class="C"><i
					id="User_Info_Sure">5</i><br>今日可发</span>
			</div>
			<ul class="Left_Nav_Item">
				<li><a href="/vote/toSingleVote" target="_blank">文字投票</a>
				</li>
				<li><a href="javascript:void(0);" class="active">图片投票<img
						src="http://www.wanyan.com/webapp/css/publish/img/x2.png">
				</a>
				</li>
			</ul>
		</div>
		<div class="Publish_Right">
			<div class="Words_Regional" style="display: none;"></div>
			<div class="Images_Regional" id="Images_Regional"
				style="display: block;">
				<div class="Fillet_Style Hook_IcoX Img_ItemA">
					<input class="Input_Style Img_BoxA" id="Img_BoxA" type="text"
						placeholder="投票标题（限20字内）">
					<div class="Img_BoxA_Txt" style="display: none;">20 /20</div>
				</div>
				<div class="clearfix Img_ItemB f-cb" id="Img_ItemB">
					<div class="Img_List">
						<p class="Fillet_Style Layer_Img A">
							<input type="file" class="fileUpload" /> 
							<img src="" style="display:none" class="show_upload_img" /> 
							<input type="text" class="filedesc"/>
						</p>
					</div>
					<a href="javascript:void(0);" class="Fillet_Style Img_Add">添加图片</a>
					<a href="javascript:void(0);" class="Fillet_Style Img_Upload">上传图片</a>
				</div>
				<div class="Img_ItemC">
					<textarea class="Fillet_Style Input_Style Img_BoxC" id="Img_BoxC"
						placeholder="关于此投票，说点什么吧..."></textarea>
					<div class="Img_BoxC_Txt" style="display: none;">800 /800</div>
				</div>
				<div class="Img_ItemD">
					<div class="Fillet_Style Hook_IcoX A">

						截止时间： <input class='flatpickr' data-enable-time='true'>

					</div>
					<div class="Fillet_Style B">
						关键字：<input type="text" class="Input_Style Img_BoxD" id="Img_BoxD"
							placeholder="多个关键字请用半角，隔开">
						<div class="Img_BoxD_Txt" style="display: none;">15 /15</div>
					</div>
					<div class="Fillet_Style C" id="Img_Date_Son"
						style="display: none;"></div>
				</div>
				<div class="Img_ItemE">
					<div class="Fillet_Style Hook_IcoX A" id="Template_Map">
						投票模板：<label><input type="radio" value="单选" name="select" />单选</label>
						<label><input type="radio" value="多选" name="select" />多选</label>
					</div>
					<div class="Fillet_Style Hook_IcoX B">
						投票分类：<a href="javascript:void(0);"
							class="Fillet_Style sp_class_right" id="vote_Classification">选择分类</a>
					</div>
				</div>
				<div class="Error_Message" id="Error_Message"></div>
				<div class="Regional_Submit">
					<a href="javascript:void(0);" class="Fillet_Style B"
						id="Img_Release">发布</a> <a href="javascript:void(0);"
						class="Fillet_Style A" id="Img_Preview">预览</a>
				</div>
			</div>
		</div>
	</div>
	<div class="Fillet_Style tyle_floating_layer" id="tyle_floating_layer"
		style="left: 409.5px; top: 162.5px; display:none">
		<p class="clearfix A f-cb">
			<a data-item="101" title="服装饰品" href="javascript:;">服装饰品</a> <a
				data-item="102" title="餐饮美食" href="javascript:;">餐饮美食</a> <a
				data-item="103" title="住房家居" href="javascript:;">住房家居</a> <a
				data-item="104" title="出行交通" href="javascript:;">出行交通</a> <a
				data-item="105" title="网络生活" href="javascript:;">网络生活</a> <a
				data-item="106" title="汽车生活" href="javascript:;">汽车生活</a> <a
				data-item="107" title="健康生活" href="javascript:;">健康生活</a> <a
				data-item="108" title="手机数码" href="javascript:;">手机数码</a> <a
				data-item="109" title="美容化妆" href="javascript:;">美容化妆</a> <a
				data-item="110" title="亲子育儿" href="javascript:;">亲子育儿</a> <a
				data-item="111" title="家用电器" href="javascript:;">家用电器</a> <a
				data-item="112" title="宠物花鸟" href="javascript:;">宠物花鸟</a>
		</p>
		<p class="clearfix B f-cb">
			<a data-item="201" title="金融理财" href="javascript:;">金融理财</a> <a
				data-item="202" title="商业服务" href="javascript:;">商业服务</a> <a
				data-item="203" title="教育培训" href="javascript:;">教育培训</a> <a
				data-item="204" title="求职就业" href="javascript:;">求职就业</a> <a
				data-item="205" title="医疗保障" href="javascript:;">医疗保障</a> <a
				data-item="206" title="全球视野" href="javascript:;">全球视野</a>
		</p>
		<p class="clearfix C f-cb">
			<a data-item="301" title="图书音像" href="javascript:;">图书音像</a> <a
				data-item="302" title="旅游休闲" href="javascript:;">旅游休闲</a> <a
				data-item="303" title="体育娱乐" href="javascript:;">体育娱乐</a> <a
				data-item="304" title="游戏动漫" href="javascript:;">游戏动漫</a> <a
				data-item="305" title="开心搞笑" href="javascript:;">开心搞笑</a> <a
				data-item="306" title="两性生活" href="javascript:;">两性生活</a>
		</p>
		<p class="close_tyle">
			<img src="http://www.wanyan.com/webapp/css/publish/img/x19.png">
		</p>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/core.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/Timer/dist/flatpickr.js"></script>
	<script type="text/javascript">
		$('.flatpickr').flatpickr();
	</script>

</body>
</html>
