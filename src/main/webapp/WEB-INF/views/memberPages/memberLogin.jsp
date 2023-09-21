<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-05
  Time: 오전 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>로그인 페이지</title>
    <style >

        .btn-colour-1 {
            color: #fff;
            background-color: #661da7;
            border-color: #661da7;
            font-weight: bold;
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

        .css-qaxuc4 {
            display: block;
            padding: 0px 10px;
            text-align: center;
            overflow: hidden;
            width: 100%;
            height: 54px;
            border-radius: 3px;
            color: rgb(255, 255, 255);
            background-color: rgb(95, 0, 128);
            border: 0px none;
        }

        .css-hxorrg {
            display: block;
            padding: 0px 10px;
            text-align: center;
            overflow: hidden;
            width: 100%;
            height: 54px;
            border-radius: 3px;
            color: rgb(95, 0, 128);
            background-color: rgb(255, 255, 255);
            border: 1px solid rgb(95, 0, 128);
        }

        .css-1bb6q2p {
            min-width: 1050px;
            margin-top: 90px;
            margin-bottom: 60px;
            background-color: rgb(255, 255, 255);
        }

        .css-1axolzg {
            width: 340px;
            margin: 0px auto;
            letter-spacing: -0.6px;
        }

        .css-i4t6me {
            color: #333;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
        <div class="css-1bb6q2p">
            <div class="css-1axolzg">
                <h1 class="text-center mb-5">로그인</h1>
                    <form action="/member/login" id="frm" method="post" style="border:0 solid black">
                            <div>
                            <input type="text" name="memberEmail" class="form-control mb-1" placeholder="이메일을 입력해주세요">
                            <input type="password" name="memberPassword" class="form-control mb-1" placeholder="비밀번호를 입력해주세요">
                            </div>
                        <div class="text-end" class="css-i4t6me" style="font-size: 13px; margin-top: 10px; margin-bottom: 5px">

                            <div class="css-i4t6me"><a style="color: #333; text-decoration: none
" href="/member/search">아이디 찾기</a> | <a style="color: #333; text-decoration: none" href="/member/search">비밀번호 찾기</a></div>
                        </div>
                        <div>
                            <button type="submit" class="css-qaxuc4 mb-1">로그인</button>
                            <button href="/member/save" class="css-hxorrg">회원가입</button>
                        </div>

                    </form>
            </div>
        </div>

<%@include file="../component/footer.jsp"%>

</body>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const frm = document.getElementById('frm')
        frm.addEventListener('submit', (event) => {
            // 기본 동작(페이지 새로고침) 방지
            event.preventDefault();
            const memberEmail = document.getElementsByName('memberEmail')[0].value.trim();
            console.log(memberEmail);
            const memberPassword = document.getElementsByName('memberPassword')[0].value.trim();

            if (!memberEmail || !memberPassword ) {
                event.preventDefault();
                alert('모든 필드를 작성해주세요.');
            }else{
                frm.submit();
            }
        });
    });

</script>
</html>
