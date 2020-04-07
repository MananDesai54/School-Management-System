<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	.paid {
		color:green;
		font-size:1.5em
	}
	.notpaid {
		color:red;
		font-size:1.5em;
	}*{
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
<script src="https://kit.fontawesome.com/1b8ba3dee0.js" crossorigin="anonymous"></script>
</head>
<body>
	<%
	if(session != null) {
			Boolean flag = (Boolean)session.getAttribute("login");
			if(flag==null || flag==false) {
				session.setAttribute("login", false);
				response.sendRedirect("login.jsp");
			}else if(flag) {%>
	<h1>Check Result</h1>
	<a href="home.jsp" target="blank">Back to Home</a>
	<table class="table">
                            <thead>
                                <tr>
                                    <th>User Name</th>
                                    <th>Result</th>
                                    <th>Tick</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                	String[] arr = (String[])session.getAttribute("percentage");
                                	for(int i=0;i<arr.length;i=i+2) {%>
                                		<tr>
                                			<td><%=arr[i] %></td>
                                			<td><%=arr[i+1] %></td>
                                			<td><%
                                			if(Integer.parseInt(((String)arr[i+1]).substring(0, 2))>33) {%>
													<div class="paid">
														Pass <i class="fas fa-check-circle"></i>
													</div>
												<%}else {%>
												<div class="notpaid">
														Fail <i class="fas fa-times-circle"></i>
												</div>
												<%}%>
											</td>
                                		</tr>
                                	<%} %>
                               
                            </tbody>
                        </table>
                        <%}} %>
</body>
</html>