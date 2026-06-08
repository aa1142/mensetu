<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="comunity.GesiVO, comunity.GesiDAO, comunity.CommentDAO, comunity.CommentVO, java.util.List" %>
<jsp:useBean id="dao" class="comunity.GesiDAO"></jsp:useBean>
<jsp:useBean id="cDao" class="comunity.CommentDAO"></jsp:useBean>

<%
    String bnumStr = request.getParameter("boardNum");

    if (bnumStr == null || bnumStr.trim().equals("")) {
        out.print("<script>alert('エラー'); history.back();</script>");
        return;
    }

    int bnum = Integer.parseInt(bnumStr);
    GesiVO vo = dao.getdetail(bnum);
    String loginId = (String)session.getAttribute("loginID");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/view.css">
    <title>詳細</title>
</head>
<body>
    <div class="view-container">
        <div class="view-header">
            <h2><%= vo.getTitle() %></h2>
            <div class="info">
                <span>作成者: <%= vo.getMemid() %></span> | 
                <span>作成日: <%= vo.getRegDate() %></span>
            </div>
        </div>

        <div class="view-content">
            <pre><%= vo.getContent() %></pre>
        </div>

        <div class="footer-btns">
            <a href="main.jsp" class="btn">一覧へ</a>
            <% if(loginId != null && loginId.equals(vo.getMemid())) { %>
                <a href="boardDelete.jsp?boardNum=<%=bnum%>" class="btn" onclick="return confirm('削除しますか？')">削除</a>
            <% } %>
        </div>

        <hr>

        <div class="comment-section">
            <h3>コメント</h3>
            
            <form action="commentProc.jsp" method="post">
                <input type="hidden" name="boardNum" value="<%=bnum%>">
                <textarea name="c_content" placeholder="コメントを入力してください" required></textarea>
                <button type="submit">登録</button>
            </form>

            <div class="comment-list">
                <%
                    List<CommentVO> list = cDao.getComments(bnum);
                    for(CommentVO cVo : list) {
                %>
                    <div class="comment-item">
                        <strong><%=cVo.getMemid()%></strong>
                        <span>(<%=cVo.getReg_date()%>)</span>
                        <p><%=cVo.getC_content()%></p>
                        <% if(loginId != null && loginId.equals(cVo.getMemid())) { %>
                            <a href="commentDelete.jsp?c_num=<%=cVo.getC_num()%>&boardNum=<%=bnum%>" 
                               onclick="return confirm('削除しますか？')">削除</a>
                        <% } %>
                    </div>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>