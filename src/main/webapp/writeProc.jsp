<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="vo" class="comunity.GesiVO" scope="page">
    <jsp:setProperty name="vo" property="*" />
</jsp:useBean>
<jsp:useBean id="dao" class="comunity.GesiDAO" scope="page" />
<%
    String writer = (String) session.getAttribute("loginID");
    vo.setMemid(writer);

    boolean result = dao.insertGesi(vo.getTitle(), vo.getContent(), vo.getMemid());

    if (result) {
%>
    <script>
        alert("投稿が完了しました。");
        location.href = "main.jsp";
    </script>
<% } else { %>
    <script>
        alert("エラーが発生しました。");
        history.back();
    </script>
<% } %>