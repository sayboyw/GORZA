<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
		<title>비밀번호 찾기 폼</title>
		<style>
		</style>
		<script>
			$(function() {
				$("#findPw").click(function() {

					$.ajax({
						url : "mFindPw",
						type : "POST",
						data : {
							id : $("#id").val(),
							emailAll : $("#email").val(),
							pw_q : $("#pw_q").val(),
							pw_a : $("#pw_a").val(),
						},
						success : function(result) {
							alert(result);
						},
					})
				});
			})
		</script>
	</head>
	<body>
			<h3>비밀번호 찾기</h3>
			<table>
				<tr>
					<td>
						<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요."> 
					</td>
				</tr>
				
				<tr>
					<td>
						<input type="text" id="email" name="email" placeholder="이메일을 입력해주세요."> 
					</td>
				</tr>
	
				<tr>
					<td>
						<select id="pw_q" name="pw_q">
							<option>비밀번호 찾기 질문</option>
							<option>자신의 보물 제 1호는?</option>
							<option>내가 좋아하는 캐릭터는?</option>
							<option>인상 깊게 읽은 책 제목은?</option>
							<option>다시 태어나면 되고 싶은 것은?</option>
							<option>유년시절 별명은?</option>
						</select>
					</td>
				</tr>
	
				<tr>
					<td>
						<input type="text" id="pw_a" name="pw_a" placeholder="비밀번호 찾기 답변을 입력해주세요."> 
					</td>
				</tr>
				
				<tr>
					<td>
						<button id="findPw">찾기</button>
						<button onclick="history.go(-1);">취소</button>
					</td>
				</tr>
			</table>
	</body>
	
</html>