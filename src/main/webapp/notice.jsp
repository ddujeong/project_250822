<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<%@ include file="include/header.jsp" %>
<main class="container">
  <h2>📢 ${totalBoardCount } 개의 공지사항</h2>
  
  <!-- 검색 기능 -->
  <div class="top-actions" >
  <form action="notice.do?category=notice" method="get" class="search-bar search-form">
    <select name="searchType" class="search-select">
      <option value="btitle" ${searchType == 'b.btitle' ? 'selected' : '' }>제목</option>
      <option value="bcontent" ${searchType == 'b.bcontent' ? 'selected' : '' }>내용</option>
      <option value="member_id"  ${searchType == 'm.member_id' ? 'selected': '' }>작성자</option>
    </select>
    <input type="text" name="searchKeyword" value="${param.searchKeyword }" placeholder="검색어를 입력하세요" required />
    <button type="submit" class="search-btn">검색</button>
  </form>

  <c:if test="${sessionScope.user_id == 'admin'}">
    <a href="write.do" class="cta-button">새 글 작성</a>
  </c:if>
</div>
   

  <!-- 공지사항 목록 -->
  <table class="notice-table">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="bDto" items="${bDtos }">
      <tr>
        <td>${bDto.bno }</td>
        <td><a href="noticeview.do?bnum=${bDto.bnum }">${bDto.btitle }</a></td>
        <td>${bDto.memberDto.member_name }</td>
        <td>${bDto.bdate }</td>
      </tr>
      </c:forEach>
      <!-- <tr>
        <td>2</td>
        <td><a href="noticeview.do">새로운 PC방 할인 이벤트!</a></td>
        <td>관리자</td>
        <td>2025-08-18</td>
      </tr> -->
      <!-- 추가 공지사항 항목 -->
    </tbody>
  </table>

  <div class="pagination-wrapper">
  <ul class="pagination">
    <!-- 1페이지로 이동 버튼 -->
    <c:if test="${currentPage > 1}">
      <li><a href="notice.do?category=${category}&searchType=${searchType }&searchKeyword=${searchKeyword }&page=1">&laquo;</a></li>
     <!-- 이전 그룹으로 이동 버튼 -->
    </c:if>
    <c:if test="${startPage > 1 }">
		<li><a href="notice.do?category=${category}&searchType=${searchType }&searchKeyword=${searchKeyword }&page=${startPage -1 }">&lt;</a></li>
	</c:if>
    <!-- 페이지 번호 목록 -->
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
      <li class="${i == currentPage ? 'active' : ''}">
        <a href="notice.do?category=${category}&searchType=${searchType }&searchKeyword=${searchKeyword }&page=${i}">${i}</a>
      </li>
    </c:forEach>

    <!-- 다음 그룹으로 이동 버튼 -->
    <c:if test="${endPage < totalPage}">
      <li><a href="notice.do?category=${category}&searchType=${searchType }&searchKeyword=${searchKeyword }&page=${endPage + 1}">&gt;</a></li>
    </c:if>
    <!-- 마지막 페이지로 이동 버튼 -->
    <c:if test="${currentPage < totalPage}">
      <li><a href="notice.do?category=${category}&searchType=${searchType }&searchKeyword=${searchKeyword }&page=${totalPage}">&raquo;</a></li>
    </c:if>
  </ul>
</div>
</main>
<%@ include file="include/footer.jsp" %>

</body>
</html>