<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="cDao" class="comunity.CommentDAO" />
<%
    String loginId = (String)session.getAttribute("loginID");
    String c_numStr = request.getParameter("c_num");
    String bnum = request.getParameter("boardNum");

    if (loginId == null) {
        out.print("<script>alert('ログインが必要です。'); location.href='login.jsp';</script>");
        return;
    }

    // 삭제하려는 댓글의 작성자 ID를 가져오기 위해 DAO에 메서드 추가 필요
    String commentWriter = cDao.getCommentWriter(Integer.parseInt(c_numStr));

    if (loginId.equals(commentWriter)) {
        cDao.deleteComment(Integer.parseInt(c_numStr));
        response.sendRedirect("view.jsp?boardNum=" + bnum);
    } else {
        out.print("<script>alert('本人以外の削除はできません。'); history.back();</script>");
    }
%>