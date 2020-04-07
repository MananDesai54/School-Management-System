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
    	<%
    		String[] arr = (String[])session.getAttribute("studentdetail");
    		String attendence = arr[0];
    		String percentage = arr[1];
    		String feestatus = arr[2];
    		String username = arr[3];
    		String firstname = arr[4];
    		String middlename = arr[5];
    		String lastname = arr[6];
    		String birthdate = arr[7];
    	%>
			<form class="detail" action="EditStudentDetail?username=<%=arr[3] %>" method="post">
				<p><span> First Name : &nbsp; </span><input type="text" name="firstname" value="<%=firstname %>"></p>
				<p><span> Middle Name : &nbsp; </span><input type="text" name="middlename" value="<%=middlename %>"></p>
				<p><span> Last Name : &nbsp; </span><input type="text" name="lastname" value="<%=lastname %>"></p>
				<p><span> Birth Date : &nbsp; </span><input type="text" name="birthdate" value="<%=birthdate %>"></p>
				<p><span> Attendance : &nbsp; </span><input type="text" name="attendence" value="<%=attendence %>"></p>
				<p><span> Percentage : &nbsp; </span><input type="text" name="percentage" value="<%=percentage %>"></p>
				<%if(feestatus.equals("paid")) { %>
				<p><span> Fee status : &nbsp; </span><select name="feestatus"><option value="paid" selected>paid</option><option value="pending" >Pending</option></select></p>
				<%}else {%>
				<p><span> Fee status : &nbsp; </span><select name="feestatus"><option value="paid" >paid</option><option value="pending" selected>Pending</option></select></p>
				<%} %>
				<button type="submit">Update</button>
			</form>
		<%}
		}
	%>
</body>
</html>