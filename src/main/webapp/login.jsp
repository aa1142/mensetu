<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ログイン - コミュニティ</title>
    <style>
        /* 全体初期化 */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'MS PGothic', 'Meiryo', sans-serif; background-color: #f9f9f9; color: #333; font-size: 12px; }
        a { text-decoration: none; color: #666; }
        a:hover { text-decoration: underline; color: #29367c; }

        /* ログイン中央配置コンテナ */
        .login-container { width: 400px; margin: 100px auto; background-color: #fff; border: 1px solid #ccc; padding: 30px; border-radius: 2px; box-shadow: 0 2px 4px rgba(0,0,0,0.05); }
        
        /* ロゴ・タイトルエリア */
        .login-header { text-align: center; margin-bottom: 25px; }
        .login-header h1 { font-size: 22px; color: #29367c; font-weight: bold; letter-spacing: -1px; }
        .login-header h1 a { color: #29367c; }

        /* 入力フォームエリア */
        .input-group { margin-bottom: 15px; }
        .input-group label { display: block; font-weight: bold; margin-bottom: 5px; color: #555; }
        .input-field { width: 100%; height: 40px; padding: 0 10px; border: 1px solid #ccc; border-radius: 2px; font-size: 14px; outline: none; }
        .input-field:focus { border-color: #29367c; }

        /* ログインボタン */
        .btn-submit { width: 100%; height: 45px; background-color: #29367c; color: white; border: 1px solid #1f2960; font-size: 14px; font-weight: bold; border-radius: 2px; cursor: pointer; margin-top: 10px; }
        .btn-submit:hover { background-color: #1f2960; }

        /* 下部リンクエリア */
        .login-footer-links { margin-top: 20px; text-align: center; color: #ccc; font-size: 11px; }
        .login-footer-links a { margin: 0 8px; }
    </style>
</head>
<body>

    <div class="login-container">
        
        <!-- 上部ロゴエリア (クリックするとメインに戻る) -->
        <div class="login-header">
            <h1>IT_JOB_JAPAN</h1>
        </div>

        <form action="loginProc.jsp" method="post" name="loginForm">

            <div class="input-group">
                <label>ユーザーID</label>
                <input type="text" name="memid" class="input-field">
            </div>

            <div class="input-group">
                <label>パスワード</label>
                <input type="password" name="pass" class="input-field">
            </div>

            <input type="submit" value="ログイン" class="btn-submit">

        </form>

       
        <div class="login-footer-links">
        	<a href="main.jsp">メインページへ</a> | 
            <a href="regForm.jsp">会員登録</a> | 
            
        </div>

    </div>

</body>
</html>