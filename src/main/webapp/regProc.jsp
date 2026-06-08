<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="dao" class="comunity.MemDAO"></jsp:useBean>
    <jsp:useBean id="vo" class="comunity.MemVO"></jsp:useBean>
    <jsp:setProperty name="vo" property="*" />
    <% boolean flag = dao.MemberInsert(vo.getMemid(),vo.getPass(),vo.getName(),vo.getEmail()) ;%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員登録</title>
</head>
<body>
<%  if(flag==true){
	out.println("会員登録完了<br>");
	out.println("<a href='login.jsp'>ログインへ<a>");
}
	if (flag == false){
		out.println("会員登録失敗<br>");
		out.println("<a href='regForm.jsp'>ログインへ<a>");
	}
	
	%>

</body>
</html>