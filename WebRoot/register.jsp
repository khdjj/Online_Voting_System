<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>注册</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/register.css"/>
	</head>
	<style>
				select {
				width: 288px;
				height: 51px;
				border: none;
			}
	</style>
	<body>
		<h1>欢迎注册</h1>
		<div class="container w">
			<div class="main clearfix">
				<div class="reg-form fl">
					<form role="form" id="reg" method="post">
						<div class="form-item form-item-account musttxt" id="form-item-account">
							<label>用　户　名</label>
							<input type="text" name="username" id="username" class="field" placeholder="请输入用户名(建议输入QQ号)" maxlength="20"
							 required="">
						</div>
						<div class="input-tip">
							<span>长度只能在4-20个字符之间</span>
						</div>
						<div class="form-item musttxt" style="z-index: 12;">
							<label>设 置 密 码</label>
							<input type="password" name="password" id="password" class="field" placeholder="请输入密码" maxlength="20" required="">
						</div>
						<div class="input-tip">
							<span>建议使用字母、数字和符号两种及以上的组合，6-20个字符</span>
						</div>
						<div class="form-item musttxt" style="z-index:12;">
							<label>确 认 密 码</label>
							<input type="password" name="enpassword" id="enpassword" class="field" placeholder="请再次输入密码" maxlength="20"
							 required="">
						</div>
						<div class="input-tip">
							<span>请再次输入密码</span>
						</div>

						<div class="item-phone-wrap">
							<div class="form-item form-item-phone" style="z-index: 12;">
								<label class="select-country" >城市<a href="javascript:void(0)" class="arrow"></a></label>
								<select id="select-country">
									<option value="一线城市">一线城市</option>
									<option value="二线城市">二线城市</option>
									<option value="三线城市">三线城市</option>
									<option value="四线城市">四线城市</option>
									<option value="五线城市">五线城市</option>
								</select>
							</div>
							<div class="input-tip">
								<span></span>
							</div>
						</div>
						<div class="item-phone-wrap">
							<div class="form-item form-item-phone" style="z-index: 12;">
								<label class="select_sex"  >性别<a href="javascript:void(0)" class="arrow"></a></label>
								<select id="select_sex">
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
							</div>
							<div class="input-tip">
								<span></span>
							</div>
						</div>
						<div class="item-phone-wrap">
							<div class="form-item form-item-phone" style="z-index: 12;">
								<label class="select-age" >年龄<a href="javascript:void(0)" class="arrow"></a></label>
								<select  id="select_age">
									<option value="0-20岁">0-20岁</option>
									<option value="20-30岁">20-30岁</option>
									<option value="30-45岁">30-45岁</option>
									<option value="50-60岁">50-60岁</option>
									<option value="60岁以上">60岁以上</option>
								</select>
							</div>
							<div class="input-tip">
								<span></span>
							</div>
						</div>
						<div class="item-phone-wrap">
							<div class="form-item form-item-phone" style="z-index: 12;">
								<label class="select-country" id="select-country" country_id="0086">中国 + 86<a href="javascript:void(0)" class="arrow"></a></label>
								<input type="text" name="mobilenumber" id="mobilenumber" class="field" placeholder="请输入手机号" maxlength="11"
								 required="">
							</div>
							<div class="input-tip">
								<span>完成验证后，可以使用该手机登录和找回密码</span>
							</div>
						</div>
						
						<div class="item-phone-wrap">
							<div class="form-item form-item-phone" style="z-index: 12;">
								<label class="select_sex"  >申请投票权限<a href="javascript:void(0)" class="arrow"></a></label>
								<select id="select_apply">
									<option value="1">是</option>
									<option value="0">否</option>
								</select>
							</div>
							<div class="input-tip">
								<span></span>
							</div>
						</div>
						<div>
							<input class="text" type="hidden" name="invitecode" value="">
							<button type="button" id="submits" class="btn-register">立即注册</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<span class="alert"></span>
		<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
		<script src="${pageContext.request.contextPath }/js/core.js"></script>
	</body>
</html>
