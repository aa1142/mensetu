<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="dao" class="comunity.MemDAO"></jsp:useBean>
    <%
    String memid = request.getParameter("memid");
    String pass = request.getParameter("pass");
    
    int check = dao.loginCheck(memid, pass);
    %>
    <%
    if(check ==  1){
    	session.setAttribute("loginID", memid);
    	response.sendRedirect("main.jsp");
    }else if (check == 0) {
    %>
    <script type = "text/javascript">
    alert('パスワードが違います');	
    history.back();
    </script>
    <%}else { %>
<script type="text/javascript">
    alert("存在しないIDです。");
    history.go(-1);
</script>
<%} %>
    
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
</body>
</html>