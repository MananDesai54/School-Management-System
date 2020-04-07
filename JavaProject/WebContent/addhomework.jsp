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
	.top {
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
}.btn {
		display:block !important;
		border:none;
		background:orange;
		padding:10px;
		margin:10px auto;
		cursor:pointer;
	}
	input {
		height:90%;
		width:90%;
		padding:10px 1px
	}.b {
		margin-top:10px;
		background:gray;
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
	<a class="top" href="home.jsp" target="blank">Back to Home</a>
	<table class="table">
                            <thead>
                                <tr>
                                    <th>Subject</th>
                                    <th>Topic</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                	String[] arr = (String[])session.getAttribute("homework");
                                	for(int i=0;i<arr.length;i=i+2) {%>
                                		<tr>
                                			<td><%=arr[i] %><%String s = arr[i]; %></td>
                                			<td><%=arr[i+1] %><%String t = arr[i+1]; %></td>
                                			<%String s1 = "Remove?subject="+arr[i]+"&title="+arr[i+1]; %>
                                			<td><a href="<%=s1 %>" class="btn" target="iframe">Remove</a></td>
                                		</tr>
                                	<%} %>
                                		<form action="AddHomework" method="post">
	                               			<tr class="b">
	                               				
	                               				<td><input type="text" name="subject" placeholder="Subject"></td>
	                               				<td><input type="text" name="title" placeholder="HomeWork"></td>
	                               				<td><button class="btn" type="submit">Add More</button></td>
	                               				
	                               			</tr>
                               			</form>
                            </tbody>
                        </table>
                        <%}} %>
</body>
</html>