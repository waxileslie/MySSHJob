<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
			$(document)
					.ready(
							function(e) {
								$("#message").removeClass("uk-hidden");
								$('#message')
										.html(
												'<fmt:message key="user.register.username_message" />');
							})
			form.username.focus();
			return false;
		}
		if (form.name.value == "") {
			$(document)
					.ready(
							function(e) {
								$("#message").removeClass("uk-hidden");
								$('#message')
										.html(
												'<fmt:message key="user.register.name_message" />');
							})
			form.name.focus();
			return false;
		}
		if (form.email.value == "") {
			$(document)
					.ready(
							function(e) {
								$("#message").removeClass("uk-hidden");
								$('#message')
										.html(
												'<fmt:message key="user.register.email_message" />');
							})
			form.email.focus();
			return false;
		}
		if (form.password.value == "") {
			$(document)
					.ready(
							function(e) {
								$("#message").removeClass("uk-hidden");
								$('#message')
										.html(
												'<fmt:message key="user.register.password_message" />');
							})
			form.password.focus();
			return false;
		}
		if (form.password1.value == form.password.value) {
			$("#message").addClass("uk-hidden");
			return true;
		} else {
			$(document)
					.ready(
							function(e) {
								$("#message").removeClass("uk-hidden");
								$('#message')
										.html(
												'<fmt:message key="user.register.repassword_message" />');
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
		<div class="uk-vertical-align-middle" style="width: 320px">
			<!-- 登陆表单 -->
			<form method="post" action="register.do"
				onsubmit="return checkregister(this)"
				class="uk-panel uk-panel-box uk-form">
				<!-- 标题图标和文字 -->
				<p style="font-size: 34px; margin: 30px">
					<b><fmt:message key="user.register.form_title" /></b>
				</p>
				<!-- 提示信息 -->
				<div id="message" class="uk-alert uk-alert-danger uk-hidden"></div>
				<!-- 用户名 -->
				<div class="uk-form-row">
					<label class="uk-form-label"><fmt:message
							key="user.register.username" /></label>
					<div class="uk-form-controls">
						<input name="userModel.username" v-model="username" id="username"
							type="text" maxlength="50"
							placeholder="<fmt:message key="user.register.username" />"
							class="uk-width-1-1">
					</div>
				</div>
				<!-- 输入密码 -->
				<div class="uk-form-row">
					<label class="uk-form-label"><fmt:message
							key="user.register.password" /></label>
					<div class="uk-form-controls">
						<input name="userModel.password" v-model="password" id="password"
							type="password" maxlength="50"
							placeholder="<fmt:message key="user.register.password" />"
							class="uk-width-1-1">
					</div>
				</div>

				<div class="uk-form-row">
					<label class="uk-form-label">专业</label>
					<div class="uk-form-controls">
						<select id="form-h-s">
							<option>软件工程</option>
							<option>计算机科学</option>
							<option>网络工程</option>
						</select>
					</div>
				</div>


				<div class="uk-form-row">
					<label class="uk-form-label">性别</label>
					<div class="uk-form-controls">
						<label><input type="radio" name="radio"> 可爱的女孩纸</label>
						<label><input type="radio" name="radio"> 活泼的男孩纸</label>
						
					</div>
				</div>

				<div class="uk-form-row">
					<label class="uk-form-label">爱好</label>
					<div class="uk-form-controls">
						<label><input type="checkbox">唱歌</label>
						<label><input type="checkbox">读书</label>
						<label><input type="checkbox">绘画</label>
						<label><input type="checkbox">登山</label>
					</div>
				</div>



				<div class="uk-form-row">
					<label class="uk-form-label">意见箱~</label>
					<div class="uk-form-controls">
						<textarea id="form-h-t" cols="30" rows="5" placeholder="意见箱"></textarea>
					</div>
				</div>





				<!-- 注册按钮 -->
				<div class="uk-form-row">
					<button type="submit"
						class="uk-width-1-1 uk-button uk-button-large">
						<fmt:message key="user.register.register" />
					</button>
				</div>
			</form>
			<div class="uk-form-row">
				<a href="login.jsp">
					<button type="submit"
						class="uk-width-1-1 uk-button uk-button-large uk-button-primary">
						<i class="uk-icon-sign-in"></i>
						<fmt:message key="user.register.login" />
					</button>
				</a>
			</div>
		</div>
	</div>
</body>
</html>