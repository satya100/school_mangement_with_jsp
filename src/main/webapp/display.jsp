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
		pst = con.prepareStatement("select * from student");
		
		rst = pst.executeQuery();
		%>
		<table border="1">
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Age</th>
				<th>Email</th>
				<th>Password</th>
				<th>Moblile</th>
				<th>Action1</th>
				<th>Action2</th>
			</tr>
			<%
			while(rst.next()){
				int id = rst.getInt("id");
				String name = rst.getString("name");
				int age = rst.getInt("age");
				String email = rst.getString("email");
				String password = rst.getString("password");
				Long mobile = rst.getLong("mobile");
				
				%>
				<tr>
					<td><%=id %></td>
					<td><%=name %></td>
					<td><%=age %></td>
					<td><%=email %></td>
					<td><%=password %></td>
					<td><%=mobile %></td>
					<td><a href='edit.jsp?id=<%=id%>'>edit</a></td>
					<td><a href='delete.jsp?id=<%=id%>'>delete</a></td>
				</tr>
			<%
			}
			%>
		</table>
</body>
</html>