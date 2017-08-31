<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Employee Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>

Employee Message is: ${message} 

<h3>Employees List</h3>
<c:if test="${!empty employees}">
	<table class="tg">
	<tr>
		<th width="80"> ID</th>
		<th width="120"> Name</th>
		<th width="120"> City</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${employees}" var="employee">
		<tr>
			<td>${employee.id}</td>
			<td>${employee.name}</td>
			<td>${employee.city}</td>
		
        <td><a href="edit/${employee.id}" class="btn btn-warning">Edit</a> </td>
                <td><a href="${employee.id}" class="btn btn-warning">Delete</a> </td>
                </tr>
	</c:forEach>    
	</table>
    </c:if>

<h2>Create new employee</h2>
<form action="/employee1/save" method="post">
    <table class="table table-bordered">
	<c:if test="${!empty employee.name}">
        <tbody>
		<tr><th>ID</th><td> <input type=" hidden" name="id" value="${employee.id}" readonly="true" disabled = "true"></td></tr>
		    <tr><th>Name</th><td><input type="text" name="name" value="${employee.name}"   required="required"></td></tr>
            <tr><th>City</th><td><input type="text" name="city"  value="${employee.city}" required="required"></td></tr>
<tr>
	<td colspan="2">
			<c:if test="${! empty employee.name}">
				<input type="submit"
					value="<spring:message text="Edit Employee"/>" />
			</c:if></c:if>
			<c:if test="${empty employee.name}">
			<%--<tr><th>ID</th><td> <input type="hidden" name="id" value="${employee.id}"></td></tr>--%>
		    <tr><th>Name</th><td><input type="text" name="name" value="${employee.name}"   required="required"></td></tr>
            <tr><th>City</th><td><input type="text" name="city"  value="${employee.city}" required="required"></td></tr>
			<c:if  test="${empty employee.name}">
				<input type="submit"
					value="<spring:message text="Add Employee"/>" />
			</c:if></c:if>
	</td>
</tr>
</tbody>
</table>
</form>
</body>
</html>