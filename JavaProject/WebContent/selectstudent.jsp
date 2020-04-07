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
		justify-content:center;
		align-items:center;
		flex-direction:column;
	}button {
		display:block;
		border:none;
		background:orange;
		padding:10px;
		margin:10px auto;
		cursor:pointer;
	}
</style>
<body>
	<h1>Select Student</h1>
	<form action="ShowStudent" method="post">
		<select name="username">
			                                <%
                                	String[] arr = (String[])session.getAttribute("student");
                                	for(int i=0;i<arr.length;i=i+1) {%>
                                		
                                			<option value="<%=arr[i]%>"><%=arr[i] %></option>
                                		
                                	<%} %>
			
		</select>
		<button type="submit">Edit Details</button>
	</form>
</body>
</html>