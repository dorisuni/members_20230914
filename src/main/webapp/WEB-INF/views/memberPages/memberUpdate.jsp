<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-05
  Time: 오전 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
    <h2>멤버수정을 위한 페이지</h2>
    <form id="frm" action="/member/update" method="post">
        <input type="hidden" name="id" value = "${member.id}">
        이메일 <input type="text" name="memberEmail" value = "${member.memberEmail}" readonly> <br>
        비밀번호 <input type="password" name="memberPassword" value = "${member.memberPassword}"><br>
        이름 <input type="text" name="memberName" value = "${member.memberName}"><br>
        생년월일 <input type="date" name="memberBirth" value = "${member.memberBirth}"><br>
        전화번호 <input type="text" name="memberMobile" value = "${member.memberMobile}"><br>
    </form>
    <button onclick="member_update()">수정</button>
        <div id="pass-check" style="display: none;">
            <input type="text" id="board-pass" placeholder="비밀번호 입력하세요">
            <input type="button" onclick="pass_check()" value="확인">
        </div>
<%@include file="../component/footer.jsp"%>
</body>
<script>
    const member_update = () => {
        const passArea = document.getElementById("pass-check");
        passArea.style.display = "block";
    }
    const pass_check = () => {
        const inputPass = document.getElementById("board-pass").value;
        const pass = '${member.memberPassword}';
        const id = '${member.id}';
        if (inputPass == pass) {
            const frm = document.getElementById("frm");
            frm.submit();
        } else {
            alert("비밀번호 불일치!");
        }
    }

</script>
</html>
