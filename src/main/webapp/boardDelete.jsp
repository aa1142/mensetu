<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="comunity.GesiDAO" />
<%
    String loginId = (String)session.getAttribute("loginID");
    String bnumStr = request.getParameter("boardNum");

    if (loginId == null) {
        out.print("<script>alert('ログインしてください。'); location.href='login.jsp';</script>");
        return;
    }

    if (bnumStr != null && !bnumStr.trim().equals("")) {
        int bnum = Integer.parseInt(bnumStr);
        String boardWriter = dao.getBoardWriter(bnum);

        if (loginId.equals(boardWriter)) {
            dao.deleteBoard(bnum);
            response.sendRedirect("main.jsp");
        } else {
            out.print("<script>alert('本人以外の削除はできません。'); history.back();</script>");
        }
    } else {
        out.print("<script>alert('無効なリクエストです。'); history.back();</script>");
    }
%>