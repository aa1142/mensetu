<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>会員登録 - コミュニティ</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'MS PGothic', 'Meiryo', sans-serif; background-color: #f9f9f9; color: #333; font-size: 12px; }
        a { text-decoration: none; color: #666; }
        a:hover { text-decoration: underline; color: #29367c; }

        .join-container { width: 450px; margin: 60px auto; background-color: #fff; border: 1px solid #ccc; padding: 35px; border-radius: 2px; box-shadow: 0 2px 4px rgba(0,0,0,0.05); }
        .join-header { text-align: center; margin-bottom: 25px; }
        .join-header h1 { font-size: 22px; color: #29367c; font-weight: bold; }
        .join-header h1 a { color: #29367c; }
        .join-header p { margin-top: 5px; color: #888; font-size: 11px; }

        .input-group { margin-bottom: 18px; }
        .input-group label { display: block; font-weight: bold; margin-bottom: 6px; color: #555; }
        .input-field { width: 100%; height: 40px; padding: 0 10px; border: 1px solid #ccc; border-radius: 2px; font-size: 13px; outline: none; }
        .input-field:focus { border-color: #29367c; }
        
        /* 아이디 입력창과 중복확인 버튼을 가로로 배치하기 위한 스타일 */
        .id-flex { display: flex; gap: 8px; }
        .btn-idcheck { width: 90px; height: 40px; background-color: #fff; border: 1px solid #29367c; color: #29367c; font-weight: bold; border-radius: 2px; cursor: pointer; }
        .btn-idcheck:hover { background-color: #f4f6ff; }

        .required-mark { color: #ff0000; margin-left: 3px; }
        .btn-submit { width: 100%; height: 45px; background-color: #29367c; color: white; border: 1px solid #1f2960; font-size: 14px; font-weight: bold; border-radius: 2px; cursor: pointer; margin-top: 10px; }
        .btn-submit:hover { background-color: #1f2960; }
        .btn-cancel { width: 100%; height: 40px; background-color: #fff; color: #333; border: 1px solid #ccc; font-size: 13px; border-radius: 2px; cursor: pointer; margin-top: 8px; text-align: center; line-height: 40px; display: block; }
        .btn-cancel:hover { background-color: #f5f5f5; text-decoration: none; }
    </style>

    <script type="text/javascript" src="script.js"></script>
</head>
<body>

    <div class="join-container">
        <div class="join-header">
            <h1><a href="index.jsp">IT_JOB_JAPAN</a></h1>
            <p>新しくアカウントを作成してください。</p>
        </div>

        <form action="regProc.jsp" method="POST" name="regForm">
            
            <div class="input-group">
                <label for="memid">ユーザーID<span class="required-mark">*</span></label>
                <div class="id-flex">
                    <input type="text" id="memid" name="memid" class="input-field" placeholder="10文字以内" maxlength="10" onkeyup="resetIdCheck()">
                    <button type="button" class="btn-idcheck" onclick="idCheck(regForm.memid.value)">重複確認</button>
                </div>
            </div>

            <div class="input-group">
                <label for="pass">パスワード<span class="required-mark">*</span></label>
                <input type="password" id="pass" name="pass" class="input-field" placeholder="20文字以内" maxlength="20">
            </div>

            <div class="input-group">
                <label for="name">お名前<span class="required-mark">*</span></label>
                <input type="text" id="name" name="name" class="input-field" placeholder="お名前を入力してください" maxlength="20">
            </div>

            <div class="input-group">
                <label for="email">メールアドレス<span class="required-mark">*</span></label>
                <input type="text" id="email" name="email" class="input-field" placeholder="example@test.com" maxlength="20">
            </div>

            <button type="button" class="btn-submit" onclick="inputCheck()">アカウント作成</button>
            <a href="index.jsp" class="btn-cancel">キャンセル</a>
            
        </form>	
    </div>

</body>
</html>