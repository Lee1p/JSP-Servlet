<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
<style>
</style>
</head>
<body>
	<!-- ex24_jstl.jsp -->
	<h1>JSTL</h1>
	<!-- 
	   JSTL
	   - 프로그래밍 기능이 구현된 태그
	   - 자바의 제어 > 대신하기 위한 역할
	   - 변수
	   - 조건문
	   - 반목문 등..
	   - 문자열 처리
	   
	 -->

	<h2>변수 선언</h2>
	<%
	int a = 10; //지역변수
	pageContext.setAttribute("b", 20); //pageContext 변수
	%>
	<!--  JSTL 변수 -->
	<!-- 
	   JSTL 변수
	 
        마크업 언어
        - <태그명></태그명>
        - <네임스페이스:태그명></네임스페이스:태그명>
	   
	  -->
	<c:set var="c" value="30" />
	<!--  var=c 는 변수 -->

	<div>
		<%=a%></div>
	<div>a: ${a}</div>
	<!--  얘는 아무것도 반환안함 왜냐하면 내장객체가 아니기때문에 -->

	<div>
		b:
		<%=pageContext.getAttribute("b")%></div>
	<div>b: ${b}</div>

	<%-- <div>c: <%= c %></div> --%>
	<div>c: ${pageScope.c}</div>
	<div>c: ${requestScope.c}</div>
	<div>c: ${sessionScope.c}</div>
	<div>c: ${applicationScope.c}</div>

	<h2>변수 수정하기</h2>
	<c:set var="c" value="50" />
	<div>c: ${c}</div>

	<h2>변수 삭제하기</h2>
	<c:remove var="c" />
	<div>c: ${c}</div>

	<h2>변수 상태</h2>
	<c:set var="c" />
	<!--  null 상태 -->
	<c:set var="c" value="" />
	<c:set var="c" value="null" />
	<!-- 이거는 null아님 null이라는 문자열임. -->

	<div>c: ${c}</div>
	<div>c: ${empty c}</div>
	<div>c: ${empty d}</div>


	<h2>조건문</h2>
	<c:set var="num" value="10" />

	<c:if test="${num > 0}">
		<div>${num}은양수입니다.</div>
	</c:if>

	<c:if test="${num <= 0}">
		<div>${num}은양수가 아닙니다.</div>
	</c:if>

	<h2>2번째 조건문(case end랑 비슷함. 다중 if문)</h2>
	<c:choose>
		<c:when test="${num > 0}"> 양수 </c:when>
		<c:when test="${num < 0}"> 음수 </c:when>
		<c:otherwise>영</c:otherwise>
	</c:choose>

	<h2>반복문(일반 for + 향상된 for)</h2>

	<c:forEach var="i" begin="1" end="9" step="1">
		<div>숫자: ${i}</div>
	</c:forEach>

    <%
     
     
     
    
    %>

	<!--  for (String name : names)-->
	<c:forEach var="name" items="${names}">
		<div>${name}</div>
	</c:forEach>


	<table>
		<tr>
			<th>이름</th>
			<th>인덱스</th>
			<th>카운트</th>
			<th>current</th>
			<th>first</th>
			<th>last</th>
		</tr>
		<c:forEach items="${names}" var="name" varStatus="status">
			<tr>
				<td>${name}</td>
				<td>${status.index}</td>
				<td>${status.count}</td>
				<td>${status.current}</td>
				<td>${status.first}</td>
				<td>${status.last}</td>
			</tr>
		</c:forEach>
	</table>
	
	<h2>출력문</h2>
	<c:set var="txt" value="안녕하세요. <b>홍길동</b>입니다."/>
	<!--  아래 둘의 결과는 다름.  out이 들어가면 내용의 태그를 전부 이스케이프해서 출력-->
	<div>txt: ${txt}</div>
	<div>txt: <c:out value="${txt}" /></div>
	
	<hr>
	
	<div><a href = "http://localhost:8090/jsp/ex20.jsp?name=hong&age=20&gendar=m"> 페이지 이동하기 </a></div>
	
	
	<c:url var="url1" value="http://localhost:8090/jsp/ex20.jsp">
	   <c:param name="name" value="hong"></c:param>
	   <c:param name="age" value="20"></c:param>
	   <c:param name="gendar" value="m"></c:param>	   
	</c:url>
	<div><a href="${url1}"> 페이지 이동하기</a></div>
    
	



	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>
