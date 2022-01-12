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
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String gajok=request.getParameter("gajok");
	String jikchak=request.getParameter("jikchak");
	String gunsok=request.getParameter("gunsok");
	String gitasudang=request.getParameter("gitasudang");
	
	try{
		String sql="select a.id,b.name,a.gajok,a.jikchak,a.gunsok,a.gitasudang from sudang0111 a,info0111 b where a.id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			name=rs.getString("name");
			gajok=rs.getString("gajok");
			jikchak=rs.getString("jikchak");
			gunsok=rs.getString("gunsok");
			gitasudang=rs.getString("gitasudang");
			System.out.println("데이터 조회 성공");
%>
<form name="form" method="post" action="update_sudangProcess.jsp">
<h1>수당 정보 수정 화면</h1>
<table border=1 id="tab4">
   <tr>
      <th id="th3">사원번호</th>
      <td><input type="text" name="id" value="<%=id %>"></td>
      <th id="th3">이름</th>
      <td><input type="text" name="name" value="<%=name %>"></td>
   </tr>
   <tr>
      <th id="th3">가족수당</th>
      <td><input type="text" name="gajok" value="<%=gajok %>"></td>
      <th id="th3">직책수당</th>
      <td><input type="text" name="jikchak" value="<%=jikchak %>"></td>
   </tr>
   <tr>
      <th id="th3">근속수당</th>
      <td colspan=3><input type="text" name="gunsok" value="<%=gunsok %>"></td>
   </tr>
   <tr>
      <th id="th3">기타수당</th>
      <td colspan=3><input type="text" name="gitasudang" value="<%=gitasudang %>"></td>
   </tr>
   <tr>
      <td colspan=4 align=center>
         <input type="button" value="목록" id="btn2" onclick="location.href='select_sudang.jsp'">
         <input type="button" value="수정" id="btn2" onclick="check()">
      </td>
   </tr>
</table>
</form>
<script>
   function check(){
      if(document.form.name.value==""){
         alert("이름을 입력하세요.");
         document.form.name.focus();
      }else{
         document.form.submit();
      }
   }
</script>
<%
		}
	}catch(SQLException e){
		System.out.println("데이터 조회 실패");
		e.printStackTrace();
	}
%>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>