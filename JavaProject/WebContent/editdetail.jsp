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
	button {
		display:block;
		border:none;
		background:orange;
		padding:10px;
		margin:10px auto;
		cursor:pointer;
	}
	.success {
		background:rgba(0,255,0,0.1);
		color:green;
		padding:10px;
		margin:10px auto;
		border-radius:5px;
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
				
			
		<h1>Student Details</h1>
		<%
    		String msg = (String)request.getParameter("msg");
    		if(msg!=null) { %>
    			<p class="success"><%=msg %></p>
    		<%}
    	%>
    	<% if(((String)session.getAttribute("catagory")).equals("student")) { %>
			<form class="detail" action="EditDetails" method="post">
				<p><span> First name : &nbsp; </span><input type="text" name="firstname" value="<%=session.getAttribute("firstname") %>"></p>
				<p><span> Middle name : &nbsp; </span><input type="text" name="middlename" value="<%=session.getAttribute("middlename") %>"></p>
				<p><span> Last name : &nbsp; </span><input type="text" name="lastname" value="<%=session.getAttribute("lastname") %>"></p>
				<p><span> Birth date : &nbsp; </span><input type="text" name="birthdate" value="<%=session.getAttribute("birthdate") %>"></p>
				<button type="submit">Update</button>
			</form>
		<%} %>
		<% if(((String)session.getAttribute("catagory")).equals("teacher")) { %>
			<form class="detail" action="TeacherEditDetail" method="post">
				<p><span> First name : &nbsp; </span><input type="text" name="firstname" value="<%=session.getAttribute("firstname") %>"></p>
				<p><span> Middle name : &nbsp; </span><input type="text" name="middlename" value="<%=session.getAttribute("middlename") %>"></p>
				<p><span> Last name : &nbsp; </span><input type="text" name="lastname" value="<%=session.getAttribute("lastname") %>"></p>
				<p><span> Birth date : &nbsp; </span><input type="text" name="birthdate" value="<%=session.getAttribute("birthdate") %>"></p>
				<button type="submit">Update</button>
			</form>
		<%} %>
		<%}
		}
	%>
</body>
</html>