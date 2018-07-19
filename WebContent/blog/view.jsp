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
<title>${ param.number }<fmt:message key="blog.view.title" /></title>
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
			<li><a href="../tohome.do"> <fmt:message
						key="menu.home" /></a></li>
			<li><a href="edit.jsp"><fmt:message
						key="menu.edit" /></a></li>
			<li><a href="../message/tomessage.do"><fmt:message key="menu.message" /></a></li>
			<li><a href="../message/write.jsp">
					<fmt:message key="menu.write" /></a></li>
			<li><a href="../picture/topicture.do">
					<fmt:message key="menu.picture" /></a></li>
			<li><a href="../picture/upload.jsp">
					<fmt:message key="menu.upload" /></a></li>
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
			<!-- content -->

			<div class="uk-width-medium-3-4">
				<!-- 输出 -->
					<article class="uk-article">
					<h2>
						<a href="view.jsp?number=${ blog.number }&author=${ blog.author }">${ blog.title }</a>
					</h2>
					<p class="uk-article-meta">${ blog.author }
						<fmt:message key="home.published_in" />
						${ blog.create_time }
					</p>
					<p>
						<a id="modify" href="tomodifyblog.do?number=${ blog.number }"
							class="uk-hidden"><fmt:message key="blog.view.modify" /></a> <a
							id="remove" href="remove.do?number=${ blog.number }"
							class="uk-hidden" style="color: red"><fmt:message
								key="blog.view.remove" /></a>
					</p>
					<!-- <p>文章内容</p> -->
					<div class="post-body" itemprop="articleBody">${ blog.text }</div>
					</article>
				<hr class="uk-article-divider">

				<div class="uk-width-medium-3-4"
				style="background-color: #FFEEDD">
					<h3>
						<fmt:message key="blog.view.comment" />
					</h3>

					<c:forEach var="comment" items="${ listComment }">
						<c:choose>
							<c:when test="${ comment.username == user.getUsername() }">
								<article class="uk-comment uk-comment-primary"> <header
									class="uk-comment-header"> <img
									class="uk-comment-avatar" src="../static/img/user.png"
									width="50" height="50" alt="">
								<h4 class="uk-comment-title">${ comment.username }</h4>
								<ul class="uk-comment-meta uk-subnav uk-subnav-line">
									<li><span>${ comment.time }</span></li>
									<li><a href="../comment/remove.do?number=${ comment.number }"
										style="color: red"><fmt:message
												key="message.message.remove" /></a></li>
								</ul>
								</header>
								<div class="uk-comment-body">
									<p>${ comment.content }</p>
								</div>
								</article>
								<hr class="uk-article-divider">
							</c:when>
							<c:otherwise>
								<article class="uk-comment"> <header
									class="uk-comment-header"> <img
									class="uk-comment-avatar" src="../static/img/user.png""
									width="50" height="50" alt="">
								<h4 class="uk-comment-title">${ comment.username }</h4>
								<div class="uk-comment-meta">${ comment.time }</div>
								</header>
								<div class="uk-comment-body">
									<h3>${ comment.content }</h3>
								</div>
								</article>
								<hr class="uk-article-divider">
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>

				<div class="uk-width-medium-3-4">
					<h3>
						<fmt:message key="blog.view.comment_title" />
					</h3>
					<article class="uk-comment">
					<div class="uk-comment-body">
						<form action="../comment/edit.do?commentModel.blognumber=${ param.number }"
							method="post" id="form-comment" class="uk-form"
							style="background-color: #FFEEDD">
							<div class="uk-alert uk-alert-danger uk-hidden"></div>
							<div class="uk-form-row">
								<textarea name="commentModel.content" rows="6"
									placeholder="<fmt:message key="blog.view.comment_tip" />"
									style="width: 100%; resize: none;"></textarea>
							</div>
							<div class="uk-form-row">
								<button type="submit" class="uk-button uk-button-primary">
									
									<fmt:message key="blog.view.commented" />
								</button>
							</div>
						</form>
					</div>
					</article>
					<hr class="uk-article-divider">
				</div>
			</div>
			<!-- // content -->
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