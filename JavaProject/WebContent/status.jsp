<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/1b8ba3dee0.js" crossorigin="anonymous"></script>
<style>
*{
	font-family:verdana;
}
	body ,.paid,.notpaid{
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
	}
	.paid {
		color:green;
		font-size:3em
	}
	.notpaid {
		color:red;
		font-size:3em;
	}
	a {
		padding:10px;
		text-decoration:none;
		background:orange;
		color:black;
	}
</style>
</head>
<body>
<% 
		if(session != null) {
			Boolean flag = (Boolean)session.getAttribute("login");
			if(flag==null || flag==false) {
				session.setAttribute("login", false);
				response.sendRedirect("login.jsp");
			}else if(flag) {%>
	
	<%
		String status = (String)request.getParameter("status");
	System.out.println(status);
		if(status.equals("paid")) {%>
			<div class="paid">
				<p><i class="fas fa-check-circle"></i></p>
				<p>No Worries You have paid tour fees....</p>
			</div>
		<%}else {%>
		<div class="notpaid">
				<p><i class="fas fa-times-circle"></i></p>
				<p>You need to Worry because you have not paid your fees, pay it in time.....</p>
		</div>
		<%}
	%><% }}%>
	<a href="home.jsp" target="blank">Back to Home</a>
</body>
</html>