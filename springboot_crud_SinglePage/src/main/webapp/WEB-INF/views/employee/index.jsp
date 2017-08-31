<%--
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

 <h2>List of Employees</h2>
    <table class="table table-bordered">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>City</th>            
            <th>Action</th>
        </tr>
        <tbody>
            <c:forEach items="${employees}" var="employee" varStatus="itr">
                <tr>
                    <td>${employee.id}</td>
                    <td>${employee.name}</td>
                    <td>${employee.city}</td>
                    <td><a href="edit?id=${employee.id}" class="btn btn-warning">Edit</a> </td>
                <td><a href="${employee.id}" class="btn btn-warning">Delete</a> </td>
                </tr>
            </c:forEach>
        </tbody>

    </table>
 <a href="/employee1/all" class="btn btn-success"></a>


<h2>Create new employee</h2>
<form action="/employee1/save" method="post">
    <table class="table table-bordered">
        <tbody>
            <tr><th>Name</th><td><input type="text" name="name" required="required"></td></tr>
            <tr><th>City</th><td><input type="text" name="city" required="required"></td></tr>
            <tr><td colspan="2"><input type="submit" value="Add employee" class="btn btn-success"></tr>
        </tbody>
    </table>
</form>

<h2>Edit employee</h2>
<form action="/employee1/update" method="post">
    <input type="hidden" name="id" value="${employee.id}">
    <table class="table table-bordered">
        <tbody>
        <tr><th>Name</th><td><input type="text" name="name" required="required" value="${employee.name}"></td></tr>
        <tr><th>City</th><td><input type="text" name="city" required="required" value="${employee.city}"></td></tr>
        <tr><td colspan="2"><input type="submit" value="Edit employee" class="btn btn-success"></tr>
        </tbody>
    </table>
</form>
 <a href="/employee1/all" class="btn btn-success"></a>
 <script type="application/javascript" src="js/jquery.js"></script>
    <script type="application/javascript" src="js/bootstrap.js"></script>

</body>
</html>
--%>

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
Name is: ${name}
<h1>
	Add an Employee
</h1>

<c:url var="addAction" value="/save" ></c:url>

<form:form action="${addAction}" commandName='employee'   >
<table>
	<c:if test="${!empty employee.name}">
	<tr>
		<td>
			<form:label path="id">
				<spring:message text="ID"/>
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"   disabled="true" />
			<form:hidden path="id" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="name">
				<spring:message text="Name"/>
			</form:label>
		</td>
		<td>
			<form:input path="name"  />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="city">
				<spring:message text="City" />
			</form:label>
		</td>
		<td>
			<form:input path="city" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty employee.name}">
				<input type="submit"
					value="<spring:message text="Edit Employee"/>" />
			</c:if>
			<c:if test="${empty employee.name}">
				<input type="submit"
					value="<spring:message text="Add Employee"/>" />
			</c:if>
		</td>
	</tr>
</table>	

</form:form>
<br>
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
			<%--<td><a href="<c:url value='edit/${employee.id}' />" >Edit</a></td>
			<td><a href="<c:url value='delete/${employee.id}' />" >Delete</a></td>
		</tr>--%>
        <td><a href="edit?id=${employee.id}" class="btn btn-warning">Edit</a> </td>
                <td><a href="${employee.id}" class="btn btn-warning">Delete</a> </td>
                </tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>
