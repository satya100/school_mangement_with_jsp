<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rst = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/myfirst" , "root" , "root");
	pst = con.prepareStatement("update student set name=?,age=?,email=?,password=?,mobile=? where id=?");
	
	pst.setString(1, request.getParameter("name"));
	pst.setInt(2, Integer.parseInt(request.getParameter("age")));
	pst.setString(3, request.getParameter("email"));
	pst.setString(4, request.getParameter("pwd"));
	pst.setLong(5, Long.parseLong(request.getParameter("mobile")));
	pst.setInt(6, Integer.parseInt(request.getParameter("id")));
	
	pst.executeUpdate();
	%>
	<jsp:forward page="display.jsp"></jsp:forward>
</body>
</html>