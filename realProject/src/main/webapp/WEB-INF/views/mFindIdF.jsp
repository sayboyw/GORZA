<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>아이디 찾기</title>
	</head>
	<body>
		<form action="mFindId" method="post">
			<h3>아이디 찾기</h3>
			<div>
				<p>
					<label>Email</label> <input type="text" id="email" name="email" required>
				</p>
				<button type="submit" id=findBtn>찾기</button>
				<button type="button" onclick="history.go(-1);">취소</button>
			</div>
		</form>
	</body>
</html>
