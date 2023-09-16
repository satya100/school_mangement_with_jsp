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
	PreparedStatement pst = con.prepareStatement("insert into student(name,age,mobile,email,password) values(?,?,?,?,?)");
	
	pst.setString(1,request.getParameter("name"));
	pst.setInt(2, Integer.parseInt(request.getParameter("age")));
	pst.setLong(3, Long.parseLong(request.getParameter("mobile")));
	pst.setString(4, request.getParameter("email"));
	pst.setString(5, request.getParameter("pwd"));
	
	pst.executeUpdate();
	%>
	<h1><%= "Register successful" %></h1>
	<jsp:include page="login.html"/>
</body>
</html>