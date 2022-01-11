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
<h1>수당 정보 조회</h1>
<hr>
<table border=1 id="tab2">
	<tr>
		<th id="th2">no</th>
		<th id="th2">사원번호</th>
		<th id="th2">이름</th>
		<th id="th2">가족수당</th>
		<th id="th2">직책수당</th>
		<th id="th2">근속수당</th>
		<th id="th2">기타수당</th>
		<th id="th2">수당합계</th>
		<th id="th2">급여합계</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	
	try{
		String sql="select c.id,a.name,to_char(b.salary,'999,999,999'),to_char(c.gajok,'999,999,999'),to_char(c.jikchak,'999,999,999'),to_char(c.gunsok,'999,999,999'),to_char(c.gitasudang,'999,999,999'),to_char(b.salary+c.gajok+c.jikchak+c.gunsok+c.gitasudang,'999,999,999') from info0111 a,hobong0111 b,sudang0111 c where a.id=c.id and a.position=b.dunggub ";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String id=rs.getString(1);
			String name=rs.getString(2);
			String salary=rs.getString(3);
			String gajok=rs.getString(4);
			String jikchak=rs.getString(5);
			String gunsok=rs.getString(6);
			String gitasudang=rs.getString(7);
			String sum=rs.getString(8);
			no++;
%>
	<tr>
		<td align="center"><%=no %></td>
		<td align="center"><%=id %></td>
		<td align="center"><%=name %></td>
		<td align="right"><%=salary %></td>
		<td align="right"><%=gajok %></td>
		<td align="right"><%=jikchak %></td>
		<td align="right"><%=gunsok %></td>
		<td align="right"><%=gitasudang %></td>
		<td align="right"><%=sum %></td>
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