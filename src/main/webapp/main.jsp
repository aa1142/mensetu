<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="comunity.GesiDAO, comunity.GesiVO, java.util.*"%>
<%
String loginID = (String) session.getAttribute("loginID");

GesiDAO gesidao = new GesiDAO();
ArrayList<GesiVO> gesiList = gesidao.getGesiList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メインページ</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

	<header>
		<h1>
			<a href="#">IT_JOB_JAPAN</a>
		</h1>
	</header>

	<div class="main-container">

		<div class="content-left">
			<div class="gallery-title">エンジニアになりたい</div>

			<table class="board-table">
				<colgroup>
					<col style="width: 8%;">
					<col style="width: 55%;">
					<col style="width: 15%;">
					<col style="width: 14%;">
					<col style="width: 8%;">
				</colgroup>
				<thead>
					<tr>
						<th>番号</th>
						<th>タイトル</th>
						<th>筆者</th>
						<th>日付</th>
						<th>照会</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (GesiVO list : gesiList) {
					%>
					<tr>
						<td><%=list.getBoardNum()%></td>
						<td class="title-cell"><a
							href="view.jsp?boardNum=<%=list.getBoardNum()%>"><%=list.getTitle()%></a>
						</td>
						<td><%=list.getMemid()%></td>
						<td><%=new java.text.SimpleDateFormat("yyyy/MM/dd").format(list.getRegDate())%>
						</td>
						<td>0</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>

			<div class="btn-box">
				<%
				if (loginID != null) {
				%>
				<a href="writeForm.jsp" class="btn-write">新規投稿</a>
				<%
				} else {
				%>
				<a href="#"
					onclick="alert('ログインが必要です。'); location.href='login.jsp'; return false;"
					class="btn-write">新規投稿</a>
				<%
				}
				%>
			</div>
		</div>

		<div class="sidebar-right">
			<div class="login-box">

				<%
				if (loginID != null) {
				%>
				<p><%=loginID%>
					さん、ようこそ
				</p>
				<a href="logout.jsp" class="login-btn-main">ログアウト</a>
				<%
				} else {
				%>
				<p>ログインしてください。</p>
				<a href="login.jsp" class="login-btn-main">ログイン</a>
				<div class="login-sub-links">
					<a href="regForm.jsp">会員登録</a> 
				</div>
				<%
				}
				%>


			</div>

		</div>
</body>
</html>