<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="cDao" class="comunity.CommentDAO" />
<%
    String bnumStr = request.getParameter("boardNum");
    String content = request.getParameter("c_content");
    String memid = (String)session.getAttribute("loginID");

    if (bnumStr == null || bnumStr.trim().equals("")) {
        out.print("<script>alert('投稿番号がありません。'); history.back();</script>");
        return;
    }
    
    if (memid == null) {
        out.print("<script>alert('ログインが必要です。'); location.href='login.jsp';</script>");
        return;
    }

    if (content == null || content.trim().equals("")) {
        out.print("<script>alert('コメント内容を入力してください。'); history.back();</script>");
        return;
    }

    try {
        int bNum = Integer.parseInt(bnumStr);
        cDao.insertComment(bNum, memid, content);
        response.sendRedirect("view.jsp?boardNum=" + bNum);
    } catch (Exception e) {
        out.print("<script>alert('エラーが発生しました: " + e.getMessage() + "'); history.back();</script>");
    }
%>