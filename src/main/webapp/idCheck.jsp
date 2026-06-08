<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="comunity.MemDAO" %>
<%
    String memid = request.getParameter("memid");
    MemDAO dao = new MemDAO();
    boolean isExist = dao.checkId(memid);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ID重複確認</title>
</head>
<body>
    <b><%= memid %></b>
<%
    if (isExist) {
        out.println("は既に使用されているIDです。<br>");
    } else {
        out.println("は使用可能なIDです。<br>");
    }
%>
    <br>
    <a href="#" onclick="self.close(); return false;">閉じる</a>

    <script type="text/javascript">
        if (window.opener) {
    <% if (isExist) { %>
            window.opener.idcheckDone = false;
            window.opener.checkedId = "";
    <% } else { %>
            window.opener.idcheckDone = true;
            window.opener.checkedId = "<%= memid %>";
    <% } %>
        }
    </script>
</body>
</html>
