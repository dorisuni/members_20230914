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
    <title>회원가입 페이지</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        .essential{
            color: red;
        }
    </style>
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

        .css-82a6rk {
            flex: 1 1 0%;
        }
        .css-1schgvv {
            display: block;
            padding: 0px 10px;
            text-align: center;
            overflow: hidden;
            width: 65%;
            height: 44px;
            border-radius: 4px;
            color: rgb(95, 0, 128);
            background-color: rgb(255, 255, 255);
            border: 1px solid rgb(95, 0, 128);
        }

        .css-1schgvv > span {
            font-size: 14px;
            font-weight: 500;
        }

        .css-18m884r{
            display: block;
            padding: 0px 10px;
            text-align: center;
            overflow: hidden;
            width: 260px;
            height: 56px;
            border-radius: 3px;
            color: rgb(255, 255, 255);
            background-color: rgb(95, 0, 128);
            border: 0px none;
        }


    </style>
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>

<div class="css-mhmtvt">
            <div class="css-o5dw7d e1ovi4140">회원가입</div>
            <div class="css-rb0i47"><span class="css-qq9ke6">*</span>필수입력사항</div>
            <form id="frm" action="/member/save" method="post" class="card p-3">
                <div class="row">
                    <div class="col-3 col-md-3 col-sm-3">
                        <span>이메일</span><span class="essential">* </span>
                    </div>
                    <div class="col-6 col-md-6 col-sm-6">
                        <input class="form-control" type="text" name="memberEmail" onchange="checkEmail(this)", placeholder="예:dorisuni@gmail.com">
                    </div>
                    <div class="col-3 col-md-3 col-sm-3">
                        <button class="css-ufulao css-1w0ksfz" type="button" onclick="checkDuplicate()"><span>중복확인</span></button>
                    </div>
                </div>
                <p id = "checkEmail" style="display: none"></p><br>
                <div class="row">
                    <div class="col-3 col-md-3 col-sm-3">
                        <span>비밀번호</span><span class="essential">*</span>
                    </div>
                    <div class="col-6 col-md-6 col-sm-6">
                        <input class="form-control" type="password" name="memberPassword" onchange="checkPassword(this)" placeholder="비밀번호를 입력해주세요.">                    </div>
                </div>
                <p id = "checkPassword" style="display: none"></p><br>
                <div class="row">
                    <div class="col-3 col-md-3 col-sm-3">
                        <span>비밀번호확인</span><span class="essential">*</span>
                    </div>
                    <div class="col-6 col-md-6 col-sm-6">
                        <input class="form-control" type="password" name="memberPassword1" onkeyup="checkPasswordAgain(this)" placeholder="비밀번호를 한번 더 입력해주세요.">                  </div>
                </div>
                <p id = "checkPasswordAgain" style="display: none"></p><br>
                <div class="row mb-4">
                    <div class="col-3 col-md-3 col-sm-3">
                        <span>이름</span><span class="essential">*</span>
                    </div>
                    <div class="col-6 col-md-6 col-sm-6">
                        <input class="form-control" type="text" name="memberName" placeholder="이름을 입력해 주세요.">
                    </div>
                </div>

                <div class="row mb-4">
                    <div class="col-3 col-md-3 col-sm-3">
                        <span>생년월일</span><span class="essential">*</span>
                    </div>
                    <div class="col-6 col-md-6 col-sm-6">
                        <input class="form-control" type="date" name="memberBirth">
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-3 col-md-3 col-sm-3">
                        <span>전화번호</span><span class="essential">*</span>
                    </div>
                    <div class="col-6 col-md-6 col-sm-6">
                        <input class="form-control" type="text" name="memberMobile">
                    </div>
                </div>
                <div class="row mb-1">
                    <div class="col-3 col-md-3 col-sm-3">
                        <span>주소</span><span class="essential">*</span>
                    </div>
                    <div id="get-Address-Div1" style="display: none" class="col-6 col-md-6 col-sm-6">
                        <input class="form-control" type="text" id ="basic-Address" style="display: none" name="memberBasicAddress" readonly>
                    </div>
                    <div id="get-Address-Div2" class="css-82a6rk e744wfw3">
                        <button id="get-Address" class="css-1schgvv e4nu7ef3" type="button" onclick="addressCheck()" height="44" radius="4">
                            <span class="css-nytqmg e4nu7ef1"><img src="https://res.kurly.com/pc/service/cart/2007/ico_search.svg" alt="" class="css-1m3kac1 e4nu7ef0">주소 검색</span>
                        </button>
                        <span id="explain-Address" class="css-vukl2m eq6ygzw0">배송지에 따라 상품 정보가 달라질 수 있습니다.</span>
                    </div>
                </div>
                <div id="get-Address-Div3" class="d-grid gap-2 col-6 mx-auto mb-2">
                    <input class="form-control" type="text" id="detail-Address" style="display: none" name="memberDetailAddress" placeholder="상세주소를 입력해 주세요.">
                </div>
                <div class="row">
                    <div class="d-grid gap-2 col-6 mx-auto">
                        <button type="submit" class="css-18m884r">회원가입</button>
                    </div>
                </div>
            </form>
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
            const memberName = document.getElementsByName('memberName')[0].value.trim();
            const memberBirth = document.getElementsByName('memberBirth')[0].value.trim();
            const memberMobile = document.getElementsByName('memberMobile')[0].value.trim();
            const memberBasicAddress = document.getElementsByName('memberBasicAddress')[0].value.trim();
            let memberDetailAddress = document.getElementById('detail-Address')
            if (!memberEmail || !memberPassword ||!memberName||!memberBirth||!memberMobile||!memberDetailAddress) {
                event.preventDefault();
                alert('모든 필드를 작성해주세요.');
            }else{
                // alert(memberDetailAddress.value);
                frm.submit();
            }
        });
    });

    function checkEmail(obj){
        if(validEmailCheck(obj) === false){
            let email = document.getElementById('checkEmail');
            email.style.cssText = 'color: red; display: block';
            email.innerHTML = "올바른 이메일 주소를 입력해주세요.";
            obj.value='';

        }else if(validEmailCheck(obj) === true){
            let email = document.getElementById('checkEmail');
            email.style.cssText = 'color: green; display: block';
            email.innerHTML = "사용가능한 이메일 주소입니다.";
        }
    }

    function validEmailCheck(obj){
        var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        return (obj.value.match(pattern)!=null)
    }

    const checkDuplicate = () =>{
        let memberEmail = document.getElementsByName('memberEmail')[0].value.trim();
        console.log(memberEmail)
        console.log(memberEmail.length)
        if(memberEmail.length<9){
            alert("6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합")
        }else{
            $.ajax({
                type:"post",
                url: "/member/duplicate-check",
                data: {
                    memberEmail: memberEmail,
                },
                //res는 서버에서 온 응답을 받는다 res의 형태로
                //따라서 컨트롤러에서 return받는건 값이 다르므로, 이동하기 위해서는 location을 써야함.
                success: function (res){
                    console.log("성공",res);
                    alert("사용가능한 이메일 주소입니다.");
                },
                error: function (res){
                    console.log("실패",res);
                    alert("중복된 이메일 주소입니다.");
                    let email = document.getElementById('checkEmail');
                    email.style.cssText = 'color: red; display: block';
                    email.innerHTML = "중복된 이메일 주소입니다.";
                }
            });
        }

    };


    function checkPassword(obj){
        console.log(obj);
        if(obj.value.length<8){
            let password = document.getElementById('checkPassword');
            password.style.cssText = 'color: red; display: block';
            password.innerHTML = "최소 8자 이상 15자 이하 입력"
        }else{
            let password = document.getElementById('checkPassword');
            if(checkVaildPassword(obj) === false){
                password.innerHTML = "영문/숫자/특수문자(공백 제외)만 허용하며,2개 이상 조합"
            }else if(checkVaildPassword(obj) === true){
                password.style.cssText = 'display: none';
            }
        }
    }

    function checkVaildPassword(obj){
        var pattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/
        return (obj.value.match(pattern)!=null)
    };

    const checkPasswordAgain=(obj)=>{
        let memberPassword = document.getElementsByName('memberPassword')[0].value.trim();
        if(!(memberPassword === obj.value)){
            let password = document.getElementById('checkPasswordAgain');
            password.style.cssText = 'color: red; display: block';
            password.innerHTML = "동일한 비밀번호를 입력"
            console.log(memberPassword)
        }else if(memberPassword === obj.value) {
            let password = document.getElementById('checkPasswordAgain');
            password.style.cssText = 'display: none;'
        }
    }


    const addressCheck=()=>{
        new daum.Postcode({
            oncomplete: function(data){
                console.log(data);
                let explain = document.getElementById("explain-Address")
                explain.style.cssText = 'display:none'
                if(data.buildingName!=""){
                    let div1 = document.getElementById("get-Address-Div1")
                    div1.style.cssText='display:block'
                    let div3 = document.getElementById("get-Address-Div3")
                    div3.style.cssText='display:block'
                    let div4 = document.getElementById("get-Address")
                    div4.style.cssText='width:100%'
                    let memberBasicAddress = document.getElementById("basic-Address");
                    memberBasicAddress.value = (data.address + " " + data.buildingName);
                    memberBasicAddress.style.cssText = 'display: block';
                    let memberDetailAddress = document.getElementById("detail-Address")
                    memberDetailAddress.style.cssText='display:block';
                }else{
                    let div1 = document.getElementById("get-Address-Div1")
                    div1.style.cssText='display:block'
                    let div4 = document.getElementById("get-Address")
                    div4.style.cssText='width:100%'
                    let div3 = document.getElementById("get-Address-Div3")
                    div3.style.cssText='display:block'
                    let memberBasicAddress = document.getElementById("basic-Address");
                    memberBasicAddress.value = (data.address);
                    memberBasicAddress.style.cssText = 'display: block';
                    let memberDetailAddress = document.getElementById("detail-Address")
                    memberDetailAddress.style.cssText='display:block';
                }
            }
        }).open();
    }


</script>

</html>
