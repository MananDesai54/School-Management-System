<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	* {
		font-family:verdana;
	}
	body {
		position:relative;
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
	<h1>Fee Structure</h1>
	<a href="FeeStatus">Check My Fee Status</a>
	<table style="border-collapse: collapse; border: 1px solid #3d3d3d;" border="1" width="100%" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td style="padding: 5px;"><strong>S.No.</strong></td>
<td style="padding: 5px;"><strong>Particulars</strong></td>
<td style="padding: 5px;" colspan="2"><strong>Amount (Rs.)</strong></td>
</tr>
<tr>
<td style="padding: 5px;" colspan="4"><strong>A. AT THE TIME OF ADMISSION</strong></td>
</tr>
<tr>
<td style="padding: 5px;">1)</td>
<td style="padding: 5px;">Prospectus&nbsp; / Registration Charges</td>
<td style="padding: 5px;" colspan="2">1200.00</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="4"><strong>B. AT THE TIME OF ADMISSION</strong></td>
</tr>
<tr>
<td style="padding: 5px;">1)</td>
<td style="padding: 5px;"><strong>Admission&nbsp; Charges ( Non Refundable ) PN to XII</strong></td>
<td style="padding: 5px;" colspan="2">12500.00</td>
</tr>
<tr>
<td style="padding: 5px;">2)</td>
<td style="padding: 5px;"><strong>Development charges ( Non &nbsp;Refundable ) PN to XII</strong></td>
<td style="padding: 5px;" colspan="2">12000.00</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="4"><strong>C.&nbsp; MONTHLY CHARGES&nbsp; (Payable Bi-monthly )</strong></td>
</tr>
<tr>
<td style="padding: 5px;" colspan="4"><strong>Education Fees&nbsp;&nbsp;&nbsp; </strong></td>
</tr>
<tr>
<td style="padding: 5px;">1)</td>
<td style="padding: 5px;">Pre. Nursery to&nbsp;&nbsp; Prep</td>
<td style="padding: 5px;" colspan="2">3850.00</td>
</tr>
<tr>
<td style="padding: 5px;">2)</td>
<td style="padding: 5px;">I to V</td>
<td style="padding: 5px;" colspan="2">4550.00</td>
</tr>
<tr>
<td style="padding: 5px;">3)</td>
<td style="padding: 5px;">VI&nbsp; to &nbsp;VIII</td>
<td style="padding: 5px;" colspan="2">4700.00</td>
</tr>
<tr>
<td style="padding: 5px;">4)</td>
<td style="padding: 5px;">IX-XII</td>
<td style="padding: 5px;" colspan="2">4850.00</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2"><strong> HOSTEL FEE STRUCTURE</strong></td>
<td style="padding: 5px;" colspan="2">&nbsp;</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2"><strong>A)&nbsp; HOSTEL CAUTION MONEY (REFUNDABLE)</strong></td>
<td style="padding: 5px;" colspan="2">&nbsp;</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2"><strong>B)&nbsp; HOSTEL BOARDING &amp; LODGING CHARGES - GIRLS</strong></td>
<td style="padding: 5px;" colspan="2">105000</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2"><strong>C)&nbsp; HOSTEL BOARDING &amp; LODGING CHARGES - BOYS</strong></td>
<td style="padding: 5px;" colspan="2">115000</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2"><strong>D)&nbsp;HOSTEL FEE PAYMENT MODE</strong></td>
<td style="padding: 5px;"><strong>GIRLS</strong></td>
<td style="padding: 5px;"><strong>BOYS</strong></td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2">1st Installment</td>
<td style="padding: 5px;">10000</td>
<td style="padding: 5px;">12500</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2">2nd Installment</td>
<td style="padding: 5px;">19000</td>
<td style="padding: 5px;">20500</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2">3rd Installment</td>
<td style="padding: 5px;">19000</td>
<td style="padding: 5px;">20500</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2">4th Installment</td>
<td style="padding: 5px;">19000</td>
<td style="padding: 5px;">20500</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2">5th Installment</td>
<td style="padding: 5px;">19000</td>
<td style="padding: 5px;">20500</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2">6th Installment</td>
<td style="padding: 5px;">19000</td>
<td style="padding: 5px;">20500</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2">&nbsp;</td>
<td style="padding: 5px;"><strong>105000</strong></td>
<td style="padding: 5px;"><strong>115000</strong></td>
</tr>
<tr>
<td style="padding: 5px;" colspan="4"><strong>Transport Fee-Optional </strong></td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2">1</td>
<td style="padding: 5px;">TS</td>
<td style="padding: 5px;">950</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2">2</td>
<td style="padding: 5px;">MTS</td>
<td style="padding: 5px;">1160</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2">3</td>
<td style="padding: 5px;">OTS</td>
<td style="padding: 5px;">1200</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2">4</td>
<td style="padding: 5px;">AOTS</td>
<td style="padding: 5px;">1350</td>
</tr>
<tr>
<td style="padding: 5px;" colspan="2">5</td>
<td style="padding: 5px;">ACT</td>
<td style="padding: 5px;">1500</td>
</tr>
</tbody>
</table>
<%}} %>
</body>
</html>