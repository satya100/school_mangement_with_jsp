<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
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
	String name = request.getParameter("name");
	name = "%"+name+"%";
	Connection con=null;
	PreparedStatement pst = null;
	ResultSet rst = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myfirst", "root", "root");
	pst = con.prepareStatement("select * from student where name like ?");
	 pst.setString(1, name); 
	rst = pst.executeQuery();
	%>
	<table border="1">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Age</th>
			<th>Email</th>
			<th>Password</th>
			<th>Mobile</th>
		</tr>
		<%
		while(rst.next()){
			int id = rst.getInt("id");
			String name1 = rst.getString("name");
			int age = rst.getInt("age");
			String email = rst.getString("email");
			String password = rst.getString("password");
			Long mobile = rst.getLong("mobile");
			%>
			<tr>
				<td><%=id %></td>
				<td><%=name1 %></td>
				<td><%=age %></td>
				<td><%=email %></td>
				<td><%=password %></td>
				<td><%=mobile %></td>
			</tr>
		<%
		}
		%>
	</table>
</body>
</html>