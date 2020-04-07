<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
	* {
		font-family:verdana;
	}
	body {
		height:100vh;
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
	}
</style>
<body>
<% 
		if(session != null) {
			Boolean flag = (Boolean)session.getAttribute("login");
			if(flag==null || flag==false) {
				session.setAttribute("login", false);
				response.sendRedirect("login.jsp");
			}else if(flag) {%>
		<h1><%=session.getAttribute("catagory") %> Details</h1>
		<% if(((String)session.getAttribute("catagory")).equals("student")) { %>
			<div class="detail">
				<p><span> First name : &nbsp; </span> <span><%=session.getAttribute("firstname") %></span></p>
				<p><span> Middle name : &nbsp; </span> <span><%=session.getAttribute("middlename") %></span></p>
				<p><span> Last name : &nbsp; </span> <span><%=session.getAttribute("lastname") %></span></p>
				<p><span> Birth date : &nbsp; </span> <span><%=session.getAttribute("birthdate") %></span></p>
				<p><span> Standard : &nbsp; </span> <span><%=session.getAttribute("standard") %></span></p>
				<p><span> catagory : &nbsp; </span> <span><%=session.getAttribute("catagory") %></span></p>
			</div>
		<%} %>
		<% if(((String)session.getAttribute("catagory")).equals("teacher")) { %>
			<div class="detail">
				<p><span> First name : &nbsp; </span> <span><%=session.getAttribute("firstname") %></span></p>
				<p><span> Middle name : &nbsp; </span> <span><%=session.getAttribute("middlename") %></span></p>
				<p><span> Last name : &nbsp; </span> <span><%=session.getAttribute("lastname") %></span></p>
				<p><span> Birth date : &nbsp; </span> <span><%=session.getAttribute("birthdate") %></span></p>
				<p><span> Subject : &nbsp; </span> <span><%=session.getAttribute("subject") %></span></p>
				<p><span> catagory : &nbsp; </span> <span><%=session.getAttribute("catagory") %></span></p>
			</div>
		<%} %>
		<% if(((String)session.getAttribute("catagory")).equals("admin")) { %>
			<div class="detail">
				<p><span> First name : &nbsp; </span> <span><%=session.getAttribute("firstname") %></span></p>
				<p><span> Middle name : &nbsp; </span> <span><%=session.getAttribute("middlename") %></span></p>
				<p><span> Last name : &nbsp; </span> <span><%=session.getAttribute("lastname") %></span></p>
				<p><span> Birth date : &nbsp; </span> <span><%=session.getAttribute("birthdate") %></span></p>
				<p><span> catagory : &nbsp; </span> <span><%=session.getAttribute("catagory") %></span></p>
			</div>
		<%} %>
		<%}} %>
</body>
</html>