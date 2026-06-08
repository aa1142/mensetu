var idcheckDone = false;
var checkedId = "";

function idCheck(memid) {
    if (memid == "") {
        alert("IDを入力してください");
        document.regForm.memid.focus();
        return;
    }

    idcheckDone = false;
    checkedId = "";

    var url = "idCheck.jsp?memid=" + memid;
    window.open(url, "idwin", "width=400,height=200");
}

function resetIdCheck() {
    if (document.regForm.memid.value != checkedId) {
        idcheckDone = false;
        checkedId = "";
    }
}

function inputCheck() {
    if (document.regForm.memid.value == "") {
        alert("ユーザーIDを入力してください。");
        document.regForm.memid.focus();
        return;
    }

    if (idcheckDone != true || document.regForm.memid.value != checkedId) {
        alert("ユーザーIDの重複確認をしてください。");
        document.regForm.memid.focus();
        return;
    }

    if (document.regForm.pass.value == "") {
        alert("パスワードを入力してください。");
        document.regForm.pass.focus();
        return;
    }
    if (document.regForm.name.value == "") {
        alert("お名前を入力してください。");
        document.regForm.name.focus();
        return;
    }
    if (document.regForm.email.value == "") {
        alert("メールアドレスを入力してください。");
        document.regForm.email.focus();
        return;
    }

    document.regForm.submit();
}
function writeSave() {
	
	if (document.writeForm.title.value.trim() == "") {
		alert("タイトルを入力してください。");
		document.writeForm.title.focus();
		return false;
	}

	if (document.writeForm.content.value.trim() == "") {
		alert("内容を入力してください。");
		document.writeForm.content.focus();
		return false;
	}

	return true;
}
