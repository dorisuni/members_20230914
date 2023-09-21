<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="nav">
    <ul class="menu">
        <li class="menu-item">
            <a href="/">index</a>
        </li>
        <li class="menu-item">
            <a href="/member/save">회원가입</a>
        </li>
        <li class="menu-item">
        <a href="/board/list">글목록</a>
        </li>
        <!--        <li class="menu-item">-->
        <!--            <a href="/login">로그인</a>-->
        <!--        </li>-->
        <%--    로그인 계쩡이 admin일 경우에만 회원목록 링크가 보임 jstl 써야함. 추가해야함.--%>
        <c:if test="${sessionScope.loginEmail == 'admin'}">
            <li class="menu-item">
                <a href="/member/members">회원목록</a>
            </li>
        </c:if>

        <!-- 로그인 여부에 따라 로그인했으면 oo님 환영합니다. 로그아웃링크 보이고
             로그인 하지 않았으면 로그인 이 보이도록
        -->
        <li class="menu-item" id="login-area">

        </li>
    </ul>
</div>
<script>
    const loginArea = document.getElementById("login-area");
    const loginEmail = '${sessionScope.loginEmail}';
    const loginId = '${sessionScope.loginId}';
    console.log(loginEmail.length);
    if (loginEmail.length != 0) {
        // 로그인 했음
        if (loginEmail == 'admin'){
            loginArea.innerHTML = "<a href='/member/member?id=${sessionScope.loginId}'>" + "관리자" + "님 환영해요!</a>"
                ;
        }else{
            loginArea.innerHTML = "<a href='/board/save' id='save'>글 작성하기</a>"+
                "<a href='/member/member?id=${sessionScope.loginId}'>" + loginEmail + "님 환영해요!</a>"
                ;
        }

    } else {
        // 로그인 안했음
        loginArea.innerHTML = "<a href='/member/login'>로그인</a>";
    }
</script>