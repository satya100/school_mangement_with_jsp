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
	welcome to edit page
	<%
		int id1 = Integer.parseInt(request.getParameter("id"));
		
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rst = null;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/myfirst" , "root" , "root");
		pst = con.prepareStatement("select * from student where id = ?");
		
		pst.setInt(1, id1);
		rst = pst.executeQuery();
		
		%>
		<%! int id,age;
			String name,email,password;
			long mobile;%>
			
		<% 
			if(rst.next())
			{
				id = rst.getInt("id");
				name = rst.getString("name");
				age = rst.getInt("age");
				email = rst.getString("email");
				password = rst.getString("password");
				mobile = rst.getLong("mobile");
			}
	%>
	<form action="update.jsp">
		<input type="hidden" name="id" value="<%=id %>">
		Name : <input type="text" name="name" value="<%=name %>"><br><br>
		Age : <input type="text" name="age" value="<%=age %>"><br><br>
		Email : <input type="text" name="email" value="<%= email %>"><br><br>
		Password : <input type="password" name="pwd" value="<%= password %>"><br><br>
		Mobile no : <input type="text" name="mobile" value="<%= mobile %>"><br><br>
		<input type="submit" value="update">
	</form>
</body>
</html>