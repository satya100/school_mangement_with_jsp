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
	int id1 = Integer.parseInt(request.getParameter("id"));
	
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rst = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/myfirst" , "root" , "root");
	pst = con.prepareStatement("delete from student where id = ?");
	
	pst.setInt(1, id1);
	pst.execute();
	%>
	<h1><%= "Delete successful" %></h1>
	<jsp:include page="display.jsp"/>
</body>
</html>