<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<fmt:setBundle basename="cn.zrr.ssh.message.blog" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="uk-height-1-1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="user.register.title" /></title>
<link rel="stylesheet" href="../static/css/uikit.min.css">
<link rel="stylesheet" href="../static/css/uikit.gradient.min.css">
<script src="../static/js/jquery.min.js"></script>
<script type="text/javascript">
	function checkregister(form) {
		if (form.username.value == "") {
			$(document).ready(function(e) {
				$("#message").removeClass("uk-hidden");
				$('#message').html('<fmt:message key="user.register.username_message" />');
			})
			form.username.focus();
			return false;
		}
		if (form.name.value == "") {
			$(document).ready(function(e) {
				$("#message").removeClass("uk-hidden");
				$('#message').html('<fmt:message key="user.register.name_message" />');
			})
			form.name.focus();
			return false;
		}
		if (form.email.value == "") {
			$(document).ready(function(e) {
				$("#message").removeClass("uk-hidden");
				$('#message').html('<fmt:message key="user.register.email_message" />');
			})
			form.email.focus();
			return false;
		}
		if (form.phone.value == "") {
			$(document).ready(function(e) {
				$("#message").removeClass("uk-hidden");
				$('#message').html('<fmt:message key="user.register.phone_message" />');
			})
			form.email.focus();
			return false;
		}
		if (form.password.value == "") {
			$(document).ready(function(e) {
				$("#message").removeClass("uk-hidden");
				$('#message').html('<fmt:message key="user.register.password_message" />');
			})
			form.password.focus();
			return false;
		}
		if (form.password1.value == form.password.value) {
			$("#message").addClass("uk-hidden");
			return true;
		} else {
			$(document).ready(function(e) {
				$("#message").removeClass("uk-hidden");
				$('#message').html('<fmt:message key="user.register.repassword_message" />');
			})
			form.password1.focus();
			return false;
		}

	}
</script>
</head>
<body class="uk-height-1-1"
	style="background-image: url(../static/img/background1.jpg)">
	<div class="uk-vertical-align uk-text-center uk-height-1-1">
		<!-- 登录框 -->
		<div class="uk-vertical-align-middle" style="width: 400px">
			<!-- 登陆表单 -->
			<form method="post" action="register.do"
				onsubmit="return checkregister(this)"
				class="uk-panel uk-panel-box uk-form" style="background-color: #FFE6D9">
				<!-- 标题图标和文字 -->
				<p style="font-size: 34px; margin: 30px">
					<b><fmt:message key="user.register.form_title" /></b>
				</p>
				<!-- 提示信息 -->
				<div id="message" class="uk-alert uk-alert-danger uk-hidden"></div>
				<s:fielderror fieldName="userModel.username"  class="uk-alert uk-alert-danger"/>
				<s:fielderror fieldName="userModel.password"  class="uk-alert uk-alert-danger"/>
				<s:fielderror fieldName="userModel.email"  class="uk-alert uk-alert-danger"/>
				<!-- 用户名 -->
				<div class="uk-form-row">
					<label class="uk-form-label"><fmt:message
							key="user.register.username" /></label>
					<div class="uk-form-controls">
						<input name="userModel.username" v-model="username" id="username" type="text"
							maxlength="50"
							placeholder="<fmt:message key="user.register.username" />"
							class="uk-width-1-1">
					</div>
				</div>
				<!-- 姓名 -->
				<div class="uk-form-row">
					<label class="uk-form-label"><fmt:message
							key="user.register.name" /></label>
					<div class="uk-form-controls">
						<input name="userModel.name" v-model="name" id="name" type="text" maxlength="50"
							placeholder="<fmt:message key="user.register.name" />"
							class="uk-width-1-1">
					</div>
				</div>
				<!-- 性别 -->
				<div class="uk-form-row">
					<label class="uk-form-label"><fmt:message key="user.register.sex" /></label>
					<div class="uk-form-controls">
						<label style="margin-right:50px;"><input type="radio" name="radio"> <fmt:message key="user.register.sex.girl" /></label>
						<label style="margin-left:50px;"><input type="radio" name="radio"> <fmt:message key="user.register.sex.boy" /></label>
					</div>
				</div>
				<!-- 电子邮件 -->
				<div class="uk-form-row">
					<label class="uk-form-label"><fmt:message
							key="user.register.email" /></label>
					<div class="uk-form-controls">
						<input name="userModel.email" v-model="email" id="email" type="text" maxlength="50"
							placeholder="xxx@xxx.com" class="uk-width-1-1">
					</div>
				</div>
				<!-- 电话 -->
				<div class="uk-form-row">
					<label class="uk-form-label"><fmt:message
							key="user.register.phone" /></label>
					<div class="uk-form-controls">
						<input name="userModel.phone" v-model="phone" id="phone" type="text" maxlength="50"
							placeholder="<fmt:message key="user.register.phone" />"
							class="uk-width-1-1">
					</div>
				</div>
				<!-- 输入密码 -->
				<div class="uk-form-row">
					<label class="uk-form-label"><fmt:message
							key="user.register.password" /></label>
					<div class="uk-form-controls">
						<input name="userModel.password" v-model="password" id="password" type="password"
							maxlength="50" placeholder="<fmt:message key="user.register.password" />"
							class="uk-width-1-1">
					</div>
				</div>
				<!-- 重复密码 -->
				<div class="uk-form-row">
					<label class="uk-form-label"><fmt:message
							key="user.register.repassword" /></label>
					<div class="uk-form-controls">
						<input name="userModel.password1" v-model="password1" id="password1" type="password"
							maxlength="50"
							placeholder="<fmt:message key="user.register.repassword" />"
							class="uk-width-1-1">
					</div>
				</div>				
				<div class="uk-form-row">
					<label class="uk-form-label"><fmt:message key="user.register.zy" /></label>
					<div class="uk-form-controls">
						<select id="form-h-s" class="uk-width-1-1">
							<option><fmt:message key="user.register.zy.rj" /></option>
							<option><fmt:message key="user.register.zy.jk" /></option>
							<option><fmt:message key="user.register.zy.wl" /></option>
						</select>
					</div>
				</div>



				<div class="uk-form-row">
					<label class="uk-form-label"><fmt:message key="user.register.advice" /></label>
					<div class="uk-form-controls">
						<textarea id="form-h-t" cols="65" rows="4" placeholder="<fmt:message key="user.register.advice" />"></textarea>
					</div>
				</div>
				
				
				
				
				<!-- 注册按钮 -->
				<div class="uk-form-row">
					<button type="submit"
						class="uk-width-1-1 uk-button uk-button-large"style="background-color: #C4E1FF">
						<fmt:message key="user.register.register" />
					</button>
				</div>
			</form>
			<div class="uk-form-row">
				<a href="login.jsp">
					<button type="submit"
						class="uk-width-1-1 uk-button uk-button-large"
						style="background-color: #C4E1FF">
						
						<fmt:message key="user.register.login" />
					</button>
				</a>
			</div>
		</div>
	</div>
</body>
</html>