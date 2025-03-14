<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<h1>
		Test page <small>메인 페이지</small>
	</h1>

	<div>
		<input type="button" value="로그인" id="login"> <input
			type="button" value="회원가입" id="register">
	</div>

	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		const loginButton = document.querySelector("#login");
		const registerButton = document.querySelector("#register");

		// 로그인 버튼 클릭 시 이벤트
		loginButton.addEventListener("click", function() {
			// LoginServlet으로 이동
			window.location.href = "Login"; // LoginServlet으로 요청을 보냄
		});
		// 회원가입 버튼 클릭 시 이벤트
		registerButton.addEventListener("click", function() {
			// 회원가입 페이지로 이동
			window.location.href = "https://www.example.com/register"; // 예시로 URL 설정
		});
	</script>
</body>
</html>
