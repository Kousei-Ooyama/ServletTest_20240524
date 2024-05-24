<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ツイート一覧</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
	<%@taglib prefix="c" uri="jakarta.tags.core"%>
	<div class="container">
		<h1>ツイート一覧</h1>
		<%-- 新規投稿 --%>
		<p>
			<a href="new_tweet.jsp">新規投稿</a>
		</p>
		<c:if test="${newTweet_SuccessOrFailure != null}">
			<hr>
				<p>投稿の追加に${newTweet_SuccessOrFailure=="success"? "成功":"失敗"}しました。</p>
			<hr>
			<% session.removeAttribute("newTweet_SuccessOrFailure"); %>
		</c:if>
		<c:if test="${removeTweet_SuccessOrFailure != null}">
			<hr>
				<p>投稿の削除に${removeTweet_SuccessOrFailure=="success"? "成功":"失敗"}しました。</p>
			<hr>
			<% session.removeAttribute("removeTweet_SuccessOrFailure");%>
		</c:if>
		

		<%-- ツイート一覧の表示 --%>
		<form action="remove_tweet" method="post">
			<ul class="tweet-list">
				<c:forEach var="tweet" items="${tweets}">
					<li>
						<div class="tweet-content">
							<p>${tweet.content}</p>
							<p class="tweet-info">投稿者:${tweet.author } - 投稿日時:${tweet.postedAt }</p>
							<input type="submit" value="削除" name=${tweet.id }>
						</div>
							
					</li>
				</c:forEach>
			</ul>
		</form>
		
	</div>
</body>
</html>
