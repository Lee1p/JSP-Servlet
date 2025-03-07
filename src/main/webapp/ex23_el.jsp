<%@page import="com.test.java.Student"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
	   body { padding-bottom: 10px;}	
	</style>
</head>
<body>
    <h1>EL</h1>	
    
    <!-- 
        <%= 100 %> out.println()
        
    
        EL, 표현식 언어
     -->
     <%
     
         //자바 변수(데이터) > 화면 출력!!
         int a = 10;
         
         //내장 객체 
         pageContext.setAttribute("b", 20);
         request.setAttribute("c", 30);
         session.setAttribute("b", 40);
     %>
     <h2>표현식</h2>
     <div>a: <%= a %></div>
     <div>b: <%= pageContext.getAttribute("b") %></div>
     <div>c: <%= request.getAttribute("c") %></div>
     <div>d: <%= session.getAttribute("d") %></div>
	
	<h2>EL</h2>
	<div> a: ${a}</div> <!-- 이거는 출력이안됨 이유: EL 표현식은 내장 객체 컬렉션에만 적용됨. -->
	<div> b: <%= pageContext.getAttribute("b") %></div>
	<div> b: <%= session.getAttribute("b") %></div>
	<!-- 1. 위에 변수 선언을 했을때 pageContext, session 에 변수를 똑같이 b로 선언하였을때 위에 정규 표현식은  20, 40이 출력이될것이다. 하지만 EL표현식을 사용했을때 둘 다 20의 값이 나온다. 이유는 EL 표현식은 내장 객체의 키가 중복되면 영역이 작은 객체부터 우선한다. 즉, pageContext 가 생명주기가 짧기때문에 둘 다 20으로 출력이되는것이다. -->
	
	
    
	
	
	<div> b: ${b}</div>
	<div> b: ${b}</div>
	
	<!--2. 만약에 EL 표현식으로 둘 다 원래의 값을 출력하고 싶을때 즉, 키값이 충돌이 없을때 명시적으로 표현을 하면 원래의값 40을 출력할 수 있게된다. -->
	<div>pageContext.b: ${b}</div>
	<div>session.b: ${sessionScope.b}</div>
	
	
	<div> c: ${c}</div>
	<div> d: ${d}</div>
	
	<%
	   pageContext.setAttribute("n1", 10);
	   pageContext.setAttribute("n2", 3);
	   request.setAttribute("name", "홍길동");
	%>
	
	<h2>EL 기능</h2>
	
	이름: ${name}
	
	<h3>EL 연산 기능</h3>
	
	<!--  기본 자바 버전 -->
	<div>n1 + 10 = <%= (int)pageContext.getAttribute("n1") + 10 %></div>
	
	<!-- EL 버전 -->
	<div>n2 + 10 = ${n1} + 10</div> 
	<!--  이거는 아님. 왜냐하면 뒤에 10은 내장객체 컬렉션이아니니까. 10은 클라이언트 10이다. 그러면     
	     우예하나?  아래처럼 {} 괄호를 감싸면된다. -->
	<div> n2 + 10 = ${n1 + 10}</div>
	
	
	<div>n1 + n2 = <%= (int)pageContext.getAttribute("n1") + (int)pageContext.getAttribute("n2") %></div>
	
	<div>n1 + n2 = ${n1} + ${n2}</div> <!--  이것도 안된다. 뒤에는 내장객체가 아니니까 ㅋ -->
	
	
	<div>n1 + n2 = ${n1 + n2}</div>
	<div>n1 + n2 = ${n1 - n2}</div>
	<div>n1 + n2 = ${n1 * n2}</div>
	<div>n1 + n2 = ${n1 / n2}</div>
	<div>n1 + n2 = ${n1 % n2}</div>
	
	<hr>
	
	<div>n1 > n2 = ${n1 > n2}</div>
	<div>n1 &gt; n2 = ${n1 gt n2}</div> <!-- > 부등호는 &gt; 이렇게 쓰자. -->
	
	
	<div>n1 < n2 = ${n1 < n2}</div>
	<div>n1 &le; = ${n1 le n2 }</div>
	
	
    
    <div>n1 == n2 = ${n1 == n2}</div>
    <div>n1 == n2 = ${n1 eq n2}</div>
	
	<div>n1 != n2 = ${n1 != n2}</div>
	<div>n1 != n2 = ${n1 ne n2}</div>
	
	<hr>
	
	<div>${true && true}</div>
	<div>${false || true} > short-circuit</div>
	<div>${!true}</div>
	
	<div>${true and true}</div>
    <div>${false or true} > short-circuit</div>
    <div>${not true}</div>
    
    <hr>
    
    <div>${n1 > 0 ? "양수" : "음수" }</div>
    
    <hr>
    
   
    
    <%
       HashMap<String,String> map = new HashMap<>();
       map.put("name", "홍길동");
       map.put("age", "20");
       map.put("address", "서울시");
       
       pageContext.setAttribute("map", map);
    %>
    <h3>객체 멤버 접근</h3>
    
    <div>이름: <%= map.get("name") %></div>
    <div>나이: <%= map.get("age") %></div>
    <div>주소: <%= map.get("address") %></div>
    
    <div>${map}</div>
    
    <!--  이 3개는 같은 표현식인데 맨 아래가 가장편해서 많이쓴다.-->
    <div>이름: ${map.get("name")}</div>
    <div>이름: ${map["name"]}</div>
    <div>이름: ${map.name} ***</div>
    
    <div>나이: ${map.age}</div>
    <div>주소: ${map.address}</div>
    
    <%
       Student s1 = new Student();
    
       s1.setName("아무개");
       s1.setAge(25);
       s1.setAddress("서울시");
       
       pageContext.setAttribute("s1",s1);
    %>
    
    <div>이름: <%= s1.getName() %></div>
    <div>나이: <%= s1.getAge() %></div>
    <div>주소: <%= s1.getTest() %></div>
    
    
    <div>이름: ${s1.getName()}</div>
    <div>나이: ${s1["age"]}</div>
    <div>주소: ${s1.test}</div> <!-- 이거 Student.java에 있는 멤버변수명 아님. 착각하면안됨. 메서드이름임. -->
    
    
    <%
       Student s2 = null;
       pageContext.setAttribute("s2", s2);
       
       String s3 = "";
       pageContext.setAttribute("s3", s3);
       
       %>
       <div>${s2 == null}</div>
       <div>${s3 == null}</div> <!-- 빈 문자열은 null이아님 -->
       <div>${s3 == ""}</div>
	
	   <div>${empty s2}</div> <!--  문자열 비교할때 사용ㄱm -->
	   <div>${empty s3}</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>

	</script>
</body>
</html>
