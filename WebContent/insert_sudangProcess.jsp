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
	String id=request.getParameter("id");
	String gajok=request.getParameter("gajok");
	String jikchak=request.getParameter("jikchak");
	String gunsok=request.getParameter("gunsok");
	String gitasudang=request.getParameter("gitasudang");
	
	try{
		String sql="insert into sudang0111 values(?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, gajok);
		pstmt.setString(3, jikchak);
		pstmt.setString(4, gunsok);
		pstmt.setString(5, gitasudang);
		pstmt.executeQuery();
		System.out.println("데이터 등록 성공");
%>
		<script>
			alert("데이터 등록을 완료하였습니다!");
			location.href="select_sudang.jsp";
		</script>
<%
	}catch(SQLException e){
		System.out.println("데이터 등록 실패");
		e.printStackTrace();
	}
%>
		<script>
			alert("데이터 등록을 실패하였습니다!");
			history.back(-1);
		</script>
</body>
</html>