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
    <title>멤버 디테일 페이지</title>
</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>

<div class="container mt-5">
    <h2>멤버 디테일 페이지</h2>
    <div class="row">
        <div class="col-md-6">
            <table class="table">
                <tbody>
                <tr>
                    <th>멤버번호</th>
                    <td th:text="${member.id}">${member.id}</td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td th:text="${member.memberEmail}">${member.memberEmail}</td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td type="password" th:text="${member.memberPassword}">${member.memberPassword}</td>
                </tr>
                <tr>
                    <th>회원이름</th>
                    <td>${member.memberName}</td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>${member.memberBirth}</td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td th:text="${member.memberMobile}">${member.memberMobile}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <a class="btn btn-primary" href="/member/update?id=${member.id}">정보수정</a>
    <a class="btn btn-secondary" href="/member/logout">로그아웃</a>
    <button type="button" onclick="openModal()" data-bs-target="#exampleModal" data-bs-toggle="modal" class="btn btn-danger">회원탈퇴</button>
</div>



<!-- Modal -->
<div class="modal" tabindex="-1" id="exampleModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">회원탈퇴</h5>
                <button type="button" id="close-area" class="btn-close" onclick="closeModal()" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>확인 버튼을 누르면 회원이 탈퇴됩니다.</p>
                <p>삭제된 데이터는 다시 복구할 수 없으므로, 신중히 결정해 주세요.</p>
                <p>삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <a type="button" class="btn btn-secondary" id="delete" href="/member/delete?id=${member.id}" >삭제하기</a>
                <button type="button" class="btn btn-primary" onclick="closeModal()" data-bs-dismiss="modal" id="close-area1" >돌아가기</button>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    let modal = document.getElementById("exampleModal");
    function openModal() {
        const modal = document.getElementById("exampleModal");
        modal.style.display = "block";
    }

    function closeModal() {
        const modal = document.getElementById("exampleModal");
        modal.style.display = "none";
    }







</script>
<%@include file="../component/footer.jsp"%>


</html>
