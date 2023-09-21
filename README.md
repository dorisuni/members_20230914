## 회원제 게시판

20230914_회원제게시판
회원제 게시판 요구사항
1. 데이터 관련
a. 회원데이터: 회원번호(id), 이메일(memberEmail), 비밀번호(memberPassword), 이름
(memberName), 전화번호(memberMobile), 프로필사진(memberProfile)
b. 게시글데이터: 글번호(id), 제목(boardTitle), 작성자(boardWriter), 내용
(boardContents), 조회수(boardHits), 작성일자(createdAt), 첨부파일저장여부
(fileAttached)
c. 댓글데이터: 댓글번호(id), 게시글번호(boardId), 작성자(commentWriter), 작성일자
(createdAt)
2. 테이블 설계 관련
a. 필요한 테이블
i. 회원, 프로필용 파일, 게시글, 게시글 첨부파일, 댓글
b. pk, fk, not null, default, unique 등 제약 조건 모두 고려
c. 게시글과 댓글 작성자는 회원테이블의 회원번호를 참조함.
i. 게시글테이블과 댓글테이블에 회원번호 컬럼을 추가하여 참조관계 설정
d. 댓글의 게시글번호는 게시글의 글번호를 참조함.
e. 회원삭제시 해당회원이 작성한 게시글, 댓글은 모두 삭제됨.
f. 게시글 삭제시 해당 게시글에 작성된 댓글은 모두 삭제됨.
3. 화면
a. nav, footer가 있는 간단한 레이아웃 적용
b. 부트스트랩 적용해 볼 것
i. 직접 디자인도 가능
4. 주요 기능
a. index.jsp에는 회원가입, 로그인, 글목록으로 가는 버튼(또는 링크) 있음. (nav.jsp 에 작
성 가능)
b. 회원관련 기능
i. 회원가입
1. 이메일, 비밀번호, 이름, 전화번호, 프로필사진을 입력받음
20230914_회원제게시판 2
2. ajax로 이메일 중복확인을 함.
3. 비밀번호, 전화번호 등은 정규식 체크도 해볼 것.
ii. 로그인
1. 로그인 완료시 페이징처리된 글목록 화면으로 이동함
iii. 로그아웃
1. 로그아웃 완료시 index 페이지로 이동
iv. 일반회원
1. 게시글작성, 조회 가능
2. 본인이 작성한 글에 대해서만 글 상세조회시 수정, 삭제 버튼이 보임.
v. 관리자
1. 관리자 아이디는 admin 으로 함. 
2. 관리자로 로그인하면 nav에 관리자화면으로 접속할 수 있는 링크 보임
a. 일반회원이 로그인하면 보이지 않음.
b. 관리자화면으로 접속하면 회원목록 출력됨
3. 회원목록 페이지에서 회원 삭제 가능함. (회원삭제는 관리자만 가능)
a. 로그인 계정이 admin인지 판단하는 코드는 아래 코드 참고
<c:if test="${sessionScope.loginEmail == 'admin'}">
</c:if>
c. 게시판 관련 기능
i. 글쓰기 기능
1. 글쓰기할 때 작성자는 따로 입력하지 않음. 글쓰기 화면 출력되면 로그인 이메
일이 작성자 칸에 입력되어 있음.
a. 아래 코드 참고
<input type="text" name="boardWriter" value="${sessionScope.loginEmail">
2. 제목, 내용, 첨부파일을 입력할 수 있음.
ii. 페이징 목록 출력 기능
20230914_회원제게시판 3
1. 기본적으로 한화면에 5개씩글이 노출되고 페이지번호는 3개가 나옴. (바꿔도
됨)
iii. 글수정, 글삭제 기능
1. 작성자 본인만 수정, 삭제 가능
a. 아래 코드는 작성자와 로그인 사용자가 일치하는지 확인하는 내용
<c:if test="${board.boardWriter == sessionScope.loginEmail}">
조건 만족할 때 보여줄 내용
</c:if>
2. 관리자는 삭제만 가능
iv. 검색 기능
1. 작성자, 제목으로 검색할 수 있음.
d. 댓글 관련 기능
i. 댓글 작성 기능
1. 댓글작성시 글작성과 마찬가지로 작성자는 로그인 아이디가 미리 작성되어 있
음. 내용만 작성하면 됨.
e. 마이페이지 관련 기능
i. 로그인하면 마이페이지로 이동할 수 있는 링크가 보임.
ii. 마이페이지로 접속하여 회원정보 수정을 할 수 있음.
iii. 회원정보 수정 페이지에서 비밀번호를 체크하여 일치하지 않으면 수정처리를 하지
않고 alert 창을 출력함.
f. 추가로 고려해볼 수 있는 기능(필수는 아니고 선택사항 입니다.)
i. 페이징 목록에서 한화면에서 볼 수 있는 글 갯수 선택하기
ii. 조회수 순으로 목록 보여주기
iii. 회원 탈퇴 기능
iv. 댓글 삭제 기능
v. 댓글 좋아요, 싫어요 기능


```sql
create table board_table
(
    id            bigint auto_increment
        primary key,
    boardWriter   varchar(50)                        null,
    boardPass     varchar(20)                        null,
    boardTitle    varchar(50)                        null,
    boardContents varchar(3000)                      null,
    createdAt     datetime default CURRENT_TIMESTAMP null,
    boardHits     int      default 0                 null,
    fileAttached  int      default 0                 null
);
```

```sql
create table board_file_table
(
    id               bigint auto_increment
        primary key,
    originalFileName varchar(100) null,
    storedFileName   varchar(100) null,
    boardId          bigint       null,
    constraint board_file_table_ibfk_1
        foreign key (boardId) references board_table (id)
            on delete cascade
);
```

```sql
create table comment_like_table
(
    id        bigint auto_increment
        primary key,
    checkLike int default 0 null,
    commentId bigint        null,
    memberId  bigint        null,
    constraint comment_table
        foreign key (commentId) references comment_table (id)
            on delete cascade,
    constraint member_table
        foreign key (memberId) references member_table (id)
            on delete cascade
);

```

```sql
create table member_table
(
    id                  bigint auto_increment
        primary key,
    memberEmail         varchar(50)  null,
    memberPassword      varchar(20)  not null,
    memberName          varchar(20)  not null,
    memberBirth         date         not null,
    memberMobile        varchar(30)  not null,
    memberBasicAddress  varchar(200) not null,
    memberDetailAddress varchar(200) not null,
    constraint memberEmail
        unique (memberEmail)
);
```