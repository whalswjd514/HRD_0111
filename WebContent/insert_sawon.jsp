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
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	
	try{
		String sql="select sawon_seq.nextval from dual";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			no=rs.getInt(1)+1;
		}else{
			no=0;
		}
	}catch(SQLException e){
		System.out.println("시퀀스 조회 실패");
		e.printStackTrace();
	}
%>
<form name="form" method="post" action="insert_sawonProcess.jsp">
<h1>인사관리 사원등록 화면</h1>
<hr>
<table border=1 id="tab1">
	<tr>
		<th id="th1">사원번호(자동생성)</th>
		<td><input type="text" name="id" value="<%=no %>" id="in1">마지막번호+1</td>
	</tr>
	<tr>
		<th id="th1">성명</th>
		<td><input type="text" name="name" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">소속부서</th>
		<td>
		<select name="dept" id="s1">
			<option value="인사부">인사부</option>
			<option value="기획부">기획부</option>
			<option value="홍보부">홍보부</option>
			<option value="영업부">영업부</option>
			<option value="경리부">경리부</option>
		</select>
		</td>
	</tr>
	<tr>
		<th id="th1">직급</th>
		<td>
			<input type="radio" value="1"> 1급
			<input type="radio" value="2"> 2급
			<input type="radio" value="3"> 3급
			<input type="radio" value="4"> 4급
			<input type="radio" value="5"> 5급
		</td>
	</tr>
	<tr>
		<th id="th1">직책</th>
		<td><input type="text" name="duty" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">연락처</th>
		<td><input type="text" name="phone" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">주소</th>
		<td><input type="text" name="address" id="in1"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="등록" onclick="check()" id="btn1">
			<input type="button" value="취소" onclick="location.href='index.jsp'" id="btn1">
		</td>
	</tr>
</table>
<hr>
</form>
<script>
	function check(){
		if(document.form.name.value==""){
			alert("성명이 입력되지 않았습니다.");
			document.form.name.focus();
		}else{
			document.form.submit();
		}
	}
</script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>