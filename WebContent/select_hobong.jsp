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
<h1>호봉 정보 조회</h1>
<hr>
<table border=1 id="tab3">
	<tr>
		<th id="th2">no</th>
		<th id="th2">등급</th>
		<th id="th2">급여</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	
	try{
		String sql="select * from hobong0111";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String dunggub=rs.getString("dunggub");
			String salary=rs.getString("salary");
			no++;
%>
	<tr>
		<td><%=no %></td>
		<td><a href="update_hobong.jsp?dunggub=<%=dunggub %>"><%=dunggub %>급</a></td>
		<td><%=salary %></td>
	</tr>
<%
			}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
		e.printStackTrace();
	}
%>
</table>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>