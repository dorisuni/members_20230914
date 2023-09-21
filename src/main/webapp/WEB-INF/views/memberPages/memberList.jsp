<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-05
  Time: 오전 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>멤버리스트 페이지</title>
</head>
<style>

    .btn-colour-1 {
        color: #fff;
        background-color: #661da7;
        border-color: #661da7;
        letter-spacing: 0.05em;
        border-radius: .5rem;
    }

    .btn-colour-1:hover,
    .btn-colour-1:active,
    .btn-colour-1:focus,
    .btn-colour-1.active {
        /* let's darken #004E64 a bit for hover effect */
        background: #8B00FF;
        color: #ffffff;
        border-color: #8B00FF;
    }

    .btn-colour-2 {
        color: #fff;
        background-color: #661da7;
        border-color: #661da7;
        font-weight: bold;
        letter-spacing: 0.05em;
        border-radius: .5rem;
    }

    .btn-colour-2:hover,
    .btn-colour-2:active,
    .btn-colour-2:focus,
    .btn-colour-2.active {
        /* let's darken #004E64 a bit for hover effect */
        background: #8B00FF;
        color: #ffffff;
        border-color: #8B00FF;
    }

    .css-o5dw7d {
        margin-bottom: 50px;
        font-size: 28px;
        line-height: 35px;
        font-weight: 500;
        text-align: center;
        letter-spacing: -1px;
        color: rgb(51, 51, 51);
    }
    .css-mhmtvt{
        width: 640px;
        margin: 0px auto;
    }

    .css-rb0i47 {
        padding-bottom: 10px;
        border-bottom: 2px solid rgb(51, 51, 51);
        font-size: 12px;
        color: rgb(102, 102, 102);
        line-height: 17px;
        text-align: right;
    }
    .css-qq9ke6 {
        color: rgb(238, 106, 123);
    }
    .css-1w0ksfz > button {
        height: 44px;
        border-radius: 3px;
    }

    .css-ufulao {
        display: block;
        padding: 0px 10px;
        text-align: center;
        overflow: hidden;
        width: 100%;
        height: 52px;
        border-radius: 3px;
        color: rgb(95, 0, 128);
        background-color: rgb(255, 255, 255);
        border: 1px solid rgb(95, 0, 128);
    }

    .css-1w0ksfz {
        height: 42px
    ;
        border-radius: 3px;
    }



</style>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>


<div class="container">
    <div id="member-list">
        <div class="css-o5dw7d e1ovi4140">멤버리스트</div>
        <table class="table table-bordered">
            <tr>
                <td>id</td>
                <td>email</td>
                <td>name</td>
                <td>birth</td>
                <td>mobile</td>
                <td>조회</td>
                <td>삭제</td>
            </tr>
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td>${member.id}</td>
                    <td><a href="/member/member?id=${member.id}">${member.memberEmail}</a></td>
                    <td>${member.memberName}</td>
                    <td>${member.memberBirth}</td>
                    <td>${member.memberMobile}</td>
                    <td>
                        <a class="btn btn-info" href="/member/member?id=${member.id}">조회</a>
                    </td>
                    <td>
                        <a class="btn btn-danger" href="/member/delete?id=${member.id}">삭제</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>


<%@include file="../component/footer.jsp"%>

</body>
</html>
