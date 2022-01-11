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
<h1>사원 정보 조회</h1>
<hr>
<table border=1 id="tab2">
	<tr>
		<th id="th2">no</th>
		<th id="th2">성명</th>
		<th id="th2">사번</th>
		<th id="th2">직급</th>
		<th id="th2">직책</th>
		<th id="th2">연락처</th>
		<th id="th2">소속부서</th>
		<th id="th2">주소</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	
	try{
		String sql="select * from info0111";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String name=rs.getString("name");
			String id=rs.getString("id");
			String position=rs.getString("position");
			String duty=rs.getString("duty");
			String phone=rs.getString("phone");
			String dept=rs.getString("dept");
			String address=rs.getString("address");
			no++;
%>
	<tr>
		<td><%=no %></td>
		<td><%=name %></td>
		<td><a href="update_sawon.jsp?id=<%=id %>"><%=id %></a></td>
		<td><%=position %></td>
		<td><%=duty %></td>
		<td><%=phone %></td>
		<td><%=dept %></td>
		<td><%=address %></td>
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