<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	String dunggub=request.getParameter("dunggub");
	String salary=request.getParameter("salary");
	try{
		String sql="insert into hobong0111 values(?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dunggub);
		pstmt.setString(2, salary);
		pstmt.executeUpdate();
		System.out.println("데이터 등록 성공");
		%>
		<script>
			alert("데이터 등록을 완료하였습니다!");
			location.href="select_hobong.jsp";
		</script>
<%
	}catch(SQLException e){
		System.out.println("데이터 등록 실패");
	}
%>
</body>
</html>