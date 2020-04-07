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
                                    <th>Subject</th>
                                    <th>Topic</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                	String[] arr = (String[])session.getAttribute("homework");
                                	for(int i=0;i<arr.length;i=i+2) {%>
                                		<tr>
                                			<td><%=arr[i] %></td>
                                			<td><%=arr[i+1] %></td>
                                		</tr>
                                	<%} %>
                               
                            </tbody>
                        </table>
                        <%}} %>
</body>
</html>