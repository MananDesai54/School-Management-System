<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
*{
	font-family:verdana;
}
body {
		height:100vh;
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
	}
	a {
		position:absolute;
		top:5px;
		right:5px;
		padding:10px;
		text-decoration:none;
		background:orange;
		color:black;
	}
	.table thead th {
    text-transform: uppercase;
    padding: 10px 0.8rem;
    background:gray;
}
.table tbody tr td {
    padding: 0.8rem 1.2rem;
    text-align: center;
}
.table tbody tr td:first-child {
    text-align: left;
}
.table tbody tr:nth-of-type(even) {
    background: #333;
    color:#eee;
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
	<h1>Your Attendance</h1>
	<a href="home.jsp" target="blank">Back to Home</a>
	<table class="table">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Total hours</td>
                                    <td>350</td>
                                </tr>
                                <tr>
                                    <td>Your Attended hours</td>
                                    <td>300</td>
                                </tr>
                                <tr>
                                    <td>Your Attendance percentage</td>
                                    <td><%=(String)session.getAttribute("attendance") %></td>
                                </tr>
                                <tr>
                                    <td>Note</td>
                                    <td><% if(Integer.parseInt(((String)session.getAttribute("attendance")).substring(0, 2))>75) { %>
                                    	As per Requirement<%}else{%> Below Requirement <%} %>
                                    </td>                                </tr>
                               
                            </tbody>
                        </table>
                        <%}} %>
</body>
</html>