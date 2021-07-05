<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String sql="select * from notices order by to_number(seq) desc";
//db connect
//드라이버 로드
Class.forName("oracle.jdbc.driver.OracleDriver");
//접속
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";
Connection con=DriverManager.getConnection(url, user, pw);
//실행
Statement st=con.createStatement();
//결과
ResultSet rs=st.executeQuery(sql);

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%-- <%
rs.next();
%>
<%=rs.getString("seq") %> : <%=rs.getString("title") %> --%><!--확인용-->
<table width="500" border="1">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
	<%
	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString("seq") %></td>
		<td><a href="noticeDetail.jsp?c=<%=rs.getString("seq") %>"><%=rs.getString("title") %></a></td>
		<td><%=rs.getString("writer") %></td>
		<td><%=rs.getString("regdate") %></td>
		<td><%=rs.getString("hit") %></td>
	</tr>
	<% 
	}
	%>

</table>
<a href="noticeRec.jsp">Write</a>

</body>
</html>

<%
rs.close();
st.close();
con.close();
%>