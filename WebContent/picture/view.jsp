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
<title>${ param.number }<fmt:message key="picture.view.title" /></title>
<link rel="stylesheet" href="../static/css/uikit.min.css">
<link rel="stylesheet" href="../static/css/uikit.gradient.min.css">
<link rel="stylesheet" href="../static/css/awesome.css">
<script src="../static/js/jquery.min.js"></script>
<script src="../static/js/uikit.min.js"></script>
<script type="text/javascript">
	$(function() {
		if ('${ param.author }' == '${ user.getUsername() }') {
			$("#modify").removeClass("uk-hidden");
			$("#remove").removeClass("uk-hidden");
		}
	});
</script>
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
			<li><a href="../message/tomessage.do"> <fmt:message key="menu.message" /></a></li>
			<li><a href="../message/write.jsp">
					<fmt:message key="menu.write" /></a></li>
			<li><a href="../picture/topicture.do"><fmt:message key="menu.picture" /></a></li>
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
			<div class="uk-width-medium-3-4">
					<article class="uk-article">
					<h2>
						<a
							href="topictureview.do?number=${ pictureModel.number }&author=${ pictureModel.author }">${ pictureModel.name }</a>
					</h2>
					<p class="uk-article-meta">${ pictureModel.author }
						<fmt:message key="picture.picture.upload_in" />
						${ pictureModel.create_time }
					</p>
					<p>
						<a id="modify" href="topicturemodify.do?number=${ pictureModel.number }"
							class="uk-hidden"><fmt:message key="blog.view.modify" /></a> <a
							id="remove" href="remove.do?pictureModel.number=${ pictureModel.number }"
							class="uk-hidden" style="color: red"><fmt:message
								key="blog.view.remove" /></a>
					</p>
					<img src="showimage.do?number=${ param.number }"> </article>
				<hr class="uk-article-divider">
			</div>
		</div>
	</div>

	<div class="uk-margin-large-top"
		style="background-color: #FFDCB9; border-top: 1px solid #ccc;">
		<div class="uk-container uk-container-center uk-text-center">
			<div class="uk-panel uk-margin-top uk-margin-bottom">
				<p>
					<fmt:message key="menu.foot" /> [<a href="#my-id" data-uk-modal="{center:true}">...</a>]
				</p>
			</div>

		</div>
	</div>
</body>
</html>