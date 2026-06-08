<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String loginID = (String) session.getAttribute("loginID");
if (loginID == null) {
%>
<script>
	alert('ログインが必要です。');
	location.href = "login.jsp";
</script>
<%
return;
}
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/comunity/script.js"></script>
<link href="/comunity/css/write.css" type="text/css" rel="stylesheet">
<meta charset="UTF-8">
<title>作成</title>
</head>
<body>
	<div class="write-container">
		<div class="write-title">新規投稿</div>

		<form action="writeProc.jsp" method="post" name="writeForm" 
      accept-charset="UTF-8" onsubmit="return writeSave()">
			<table class="write-table">
				<tr>
					<th>筆者</th>
					<td><input type="text" name="writer" value="<%=loginID%>"
						class="input-text" style="width: 200px; background-color: #eee;"
						readonly></td>
				</tr>
				<tr>
					<th>タイトル</th>
					<td><input type="text" name="title" class="input-text"
						placeholder="タイトルを入力してください" ></td>
				</tr>
				<tr>
					<th>内容</th>
					<td><textarea name="content" class="textarea-content"
							placeholder="内容を入力してください" ></textarea></td>
				</tr>
			</table>

			<div class="btn-box">
				<button type="submit" class="btn-submit">登録</button>
				<a href="main.jsp" class="btn-cancel">キャンセル</a>
			</div>
		</form>
	</div>

</body>
</html>