<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setBundle basename="cn.zrr.ssh.message.blog" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><fmt:message key="picture.modify.title" /></title>
<link rel="stylesheet" href="../static/css/uikit.min.css">
<link rel="stylesheet" href="../static/css/uikit.gradient.min.css">
<link rel="stylesheet" href="../static/css/awesome.css">
<script src="../static/js/jquery.min.js"></script>
<script src="../static/js/uikit.min.js"></script>
</head>
<body class="uk-height-1-1">
	<nav class="uk-navbar uk-navbar-attached uk-margin-bottom">
	<div class="uk-container uk-container-center"
	style="background-color: #FFEEDD">
		<a href="#" class="uk-navbar-brand"><fmt:message key="menu.blog" /></a>
		<ul class="uk-navbar-nav">
			<li><a href="../tohome.do"><fmt:message
						key="menu.home" /></a></li>
			<li><a href="../blog/edit.jsp">
					<fmt:message key="menu.edit" /></a></li>
			<li><a href="../message/tomessage.do"><fmt:message key="menu.message" /></a></li>
			<li><a href="../message/write.jsp">
					<fmt:message key="menu.write" /></a></li>
			<li><a href="../picture/topicture.do">
					<fmt:message key="menu.picture" /></a></li>
			<li><a href="../picture/upload.jsp"><fmt:message key="menu.upload" /></a></li>
		</ul>
		<div class="uk-navbar-flip">
			<ul class="uk-navbar-nav">
				<li class="uk-parent" data-uk-dropdown><a href="#"><i
						class="uk-icon-user"></i> ${ user.getUsername() }</a>
					<div class="uk-dropdown uk-dropdown-navbar">
						<ul class="uk-nav uk-nav-navbar">
							<li><a href="../user/modify.jsp">
									<fmt:message key="menu.modify_information" /></a></li>
						</ul>
					</div></li>
				<li><a href="../user/logout.do">
						<fmt:message key="menu.logout" /></a></li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="uk-container uk-container-center"
	style="background-color: #FFEEDD">
		<div class="uk-grid">
			<div class="uk-width-1-1 uk-margin-bottom">
				<div class="uk-panel uk-panel-box">
					<ul class="uk-breadcrumb">
						<li><a href="../home.jsp"><fmt:message key="menu.home" /></a></li>
						<li><a href="../picture/picture.jsp"><fmt:message
									key="menu.picture" /></a></li>
						<li><a href="../comment/comment.jsp"><fmt:message
									key="menu.message" /></a></li>
					</ul>
				</div>
			</div>
			<div id="vm" class="uk-width-2-3">
					<form method="post" action="modify.do?pictureModel.number=${ pictureModel.number }"
						class="uk-form uk-form-stacked">
						<div class="uk-alert uk-alert-danger uk-hidden"></div>
						<div class="uk-form-row">
							<label class="uk-form-label"><fmt:message
									key="picture.modify.form_name" /></label>
							<div class="uk-form-controls">
								<input v-model="name" name="pictureModel.name" id="name" type="text"
									placeholder="<fmt:message key="picture.modify.form_name" />"
									class="uk-width-1-1" value="${ pictureModel.name }">
							</div>
						</div>
						<div class="uk-form-row">
							<label class="uk-form-label"><fmt:message
									key="picture.modify.form_picture" /></label>
							<div class="uk-form-controls">
								<img src="showimage.do?number=${ param.number }">
							</div>
						</div>
						<div class="uk-form-row">
							<button type="submit" class="uk-button">
								
								<fmt:message key="blog.modify.save" />
							</button>
							<a href="../home.jsp" class="uk-button"> <fmt:message key="blog.modify.cancel" /></a>
						</div>
					</form>
			</div>
			<!-- // content -->
		</div>
	</div>

	<div class="uk-margin-large-top"
		style="background-color: #FFDCB9; border-top: 1px solid #ccc;">
		<div class="uk-container uk-container-center uk-text-center">
			<div class="uk-panel uk-margin-top uk-margin-bottom">
				<p>
					Worked by Ranran Zhen.End in 2018.6.25 [<a href="#my-id" data-uk-modal="{center:true}">Nothing to use...</a>]
				</p>
			</div>

		</div>
	</div>
</body>
</html>