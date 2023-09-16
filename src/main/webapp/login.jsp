<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/myfirst" , "root" , "root");
	PreparedStatement pst = con.prepareStatement("select * from student where name = ?");
	pst.setString(1, request.getParameter("name"));
	ResultSet rst = pst.executeQuery();
	
	if (rst.next()) {
		if (request.getParameter("pwd").equals(rst.getString("password")))
		{%>
			<jsp:forward page="home.html"></jsp:forward>
		<%}
		else {
			%>
				<h1><%= "Invalid password" %></h1>
				<jsp:include page="login.html"></jsp:include>
			<%
		}
	} else {
		%>
			<h1><%= "Invalid Id" %></h1>
			<jsp:forward page="login.html"></jsp:forward>
		<%
	}
	%>
</body>
</html>