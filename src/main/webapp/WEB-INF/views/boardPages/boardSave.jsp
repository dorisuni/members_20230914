<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <h4>게시글 작성</h4>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-md-12">
            <form action="/board/save" method="POST" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="boardTitle" class="form-label">제목</label>
                    <input type="text" class="form-control" id="boardTitle" name="boardTitle" required>
                </div>
                <div class="mb-3">
                    <label for="boardWriter" class="form-label">작성자</label>
                    <input type="text" class="form-control" id="boardWriter" name="boardWriter" value="${sessionScope.loginEmail}" >
                </div>
                <div class="mb-3">
                    <label for="boardPass" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="boardPass" name="boardPass" required>
                </div>
                <div class="mb-3">
                    <label for="boardContents" class="form-label">글 내용</label>
                    <textarea class="form-control" id="boardContents" name="boardContents" rows="6" required></textarea>
                </div>
                <div class="mb-3">
                    <input type="file" id="boardFile" name="boardFile" multiple>
                </div>
                <button type="submit" class="btn btn-primary">작성하기</button>
            </form>
        </div>
    </div>
</div>

</body>
<%@include file="../component/footer.jsp"%>
</html>
