<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원제 게시판</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>

<%-- 검색 창 --%>
<div class="row">
    <div class="col">
        <div class="container" id="search-area">
            <h3><span style="text-decoration-color: purple">YOUTUBE</span>를 검색해 보자!</h3>
            <input type="text" id="searchTerm" placeholder="검색어를 입력하세요">
            <button onclick="searchYouTube()" class="btn btn-primary">검색</button>
        </div>
    </div>
</div>

<div id="searchResults">

</div>


<script>
    function searchYouTube() {
        const searchTerm = document.getElementById('searchTerm').value;
        console.log(searchTerm)
        const apiKey = 'AIzaSyAFgOk7WAuiTzia4JtPScEgHv6hSFmE9cM';
        const maxResults = 9; // 검색 결과의 최대 수

        // YouTube Data API 요청 만들기
        const url = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults="
            + maxResults + "&q=" + searchTerm + "&key=" + apiKey;
        console.log(url)
        // API 요청 보내기
        fetch(url)
            .then(response => response.json())
            .then(data => {
                displaySearchResults(data);
                console.log(data)
            })
            .catch(error => {
                console.error('API 요청 중 오류 발생:', error);
            });
    }

    function displaySearchResults(data) {
        const searchResults = document.getElementById('searchResults');
        searchResults.innerHTML = ''; // 이전 검색 결과 지우기

        if (data && data.items && data.items.length > 0) {
            const items = data.items;

            // 부트스트랩의 그리드를 생성합니다.
            let row = document.createElement('div');
            row.classList.add('row');

            // 검색 결과 아이템을 반복하여 카드를 생성하고 배열합니다.
            items.forEach((item, index) => {
                const videoId = item.id.videoId;
                const title = item.snippet.title;
                const description = item.snippet.description;

                // 카드 요소 생성
                const card = document.createElement('div');
                card.classList.add('col-md-4', 'mb-4'); // 3개의 카드가 한 행에 배치되도록 col-md-4 클래스 추가

                // <iframe> 요소 생성 및 설정
                const iframe = document.createElement('iframe');
                iframe.src = "https://www.youtube.com/embed/"+videoId;
                iframe.allowFullscreen = true; // 전체 화면 재생 허용
                iframe.classList.add('embed-responsive-item'); // 부트스트랩 클래스 추가

                // <iframe>을 카드 내부에 추가
                const videoContainer = document.createElement('div');
                videoContainer.classList.add('embed-responsive', 'embed-responsive-16by9'); // 부트스트랩 클래스 추가
                videoContainer.appendChild(iframe);

                const cardBody = document.createElement('div');
                cardBody.classList.add('card-body');

                const cardTitle = document.createElement('h5');
                cardTitle.classList.add('card-title');
                cardTitle.textContent = title;

                const cardText = document.createElement('p');
                cardText.classList.add('card-text');
                cardText.textContent = description;

                // 카드를 검색 결과 행에 추가
                cardBody.appendChild(cardTitle);
                cardBody.appendChild(cardText);
                card.appendChild(videoContainer);
                card.appendChild(cardBody);
                row.appendChild(card);

                // 한 행에 4개의 카드가 배치되었거나 마지막 아이템인 경우 행을 검색 결과에 추가하고 새로운 행을 생성
                if ((index + 1) % 4 === 0 || index === items.length - 1) {
                    searchResults.appendChild(row);
                    row = document.createElement('div');
                    row.classList.add('row');
                }
            });
        } else {
            searchResults.innerHTML = '검색 결과가 없습니다.';
        }
    }
</script>

</html>
