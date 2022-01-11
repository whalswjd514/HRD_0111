<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<form name="form" method="post" action="insert_hobongProcess.jsp">
<h1>인사관리 호봉 등록 화면</h1>
<hr>
<table border=1 id="tab1">
	<tr>
		<th id="th1">직급</th>
		<td>
			<select name="dunggub" id="s1">
				<option value="1">1급</option>
				<option value="2">2급</option>
				<option value="3">3급</option>
				<option value="4">4급</option>
				<option value="5">5급</option>
			</select>
		</td>
	</tr>
	<tr>
		<th id="th1">급여</th>
		<td><input type="text" name="salary" id="in1"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="submit" value="등록" id="btn1">
			<input type="button" value="취소" onclick="location.href='index.jsp'" id="btn1">
		</td>
	</tr>
</table>
<hr>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>