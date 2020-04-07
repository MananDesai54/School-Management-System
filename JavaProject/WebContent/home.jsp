<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	* {
		margin:0;
		box-sizing:border-box;
		font-family:verdana;
	}
	body {
		height:100vh;
		width:100vw;
	}
	nav {
		width:100%;
		display:flex;
		justify-content:center;
		align-items:center;
		padding:10px;
		background:#333;
		color:#eee;
	}
	a {
		text-decoration:none;
		color:#eee;
	}
	a:hover {
		text-decoration:underline;
	}
	.logo {
		flex:1 0 0;
	}.other,.profile {
		display:flex;
		align-items:center;
	}
	.other a {
		margin-right:10px;
	}
	.profile {
		background:#eee;
		color:#333;
		padding:10px;
	}
	section {
		display:flex;
		height:100%;
	}
	.sidenav {
		width:20vw;
		display:flex;
		flex-direction:column;
		align-items:center;
		background:#1a2b3c;
	}
	.sidenav a {
		margin:10px;
	}
	iframe {
		width:80vw;
		border:none;
	}
</style>
</head>
<body>

	<%
			if (session!=null) {
				Boolean flag = (Boolean)session.getAttribute("login");
				System.out.println(flag);
				if(flag!=null && flag!=false) { %>
					<nav>
						<div class="logo">
							<a href=>The ABC School</a>
						</div>
						<div class="other">
							<a href="logout.jsp">Logout</a>
							<div class="profile">
								<p> <%= session.getAttribute("name") %> </p>
							</div>
						</div>
					</nav>
					<section>
					<% if(((String)session.getAttribute("catagory")).equals("student")) { %>
						<div class="sidenav">
							<a href="Details" target="iframe">Details</a>
							<a href="Attendance" target="iframe">Attendance</a>
							<a href="Results" target="iframe">Result</a>
							<a href="feeStructure.jsp" target="iframe">FeeStucture</a>
							<a href="Homework" target="iframe">Home Work</a>
							<a href="editdetail.jsp" target="iframe">Edit Details</a>
						</div>
						<iframe src="Details" name="iframe"></iframe>
					<%} %>
					<% if(((String)session.getAttribute("catagory")).equals("teacher")) { %>
						<div class="sidenav">
							<a href="TeacherDetail" target="iframe">Details</a>
							<a href="ShowResult" target="iframe">Show Result</a>
							<a href="FeeState" target="iframe">Check Fee Status</a>
							<a href="Homework" target="iframe">Add HomeWork</a>
							<a href="editdetail.jsp" target="iframe">Edit Details</a>
						</div>
						<iframe src="TeacherDetail" name="iframe"></iframe>
					<%} %>
					<% if(((String)session.getAttribute("catagory")).equals("admin")) { %>
						<div class="sidenav">
							<a href="TeacherDetail" target="iframe">Details</a>
							<a href="signup.jsp" target="iframe">Add Student</a>
							<a href="addstudentdetail.jsp" target="iframe">Add Student Details</a>
							<a href="teachersignup.jsp" target="iframe">Add Teacher</a>
							<a href="Homework" target="iframe">Add HomeWork</a>
							<a href="SelectStudent" target="iframe">Edit Student Details</a>
							<a href="SelectTeacher" target="iframe">Edit Teacher Details</a>
							<a href="ShowResult" target="iframe">Show Result</a>
							<a href="FeeState" target="iframe">Check Fee Status</a>
						</div>
						<iframe src="TeacherDetail" name="iframe"></iframe>
					<%} %>
					</section>
				<%}else {
					response.sendRedirect("login.jsp");
				}
			}
	%></body>
</html>