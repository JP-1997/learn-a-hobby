<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trainees</title>
</head>
<body>
<h2>My Trainees:-</h2><hr />
<table>
<tr>
	<th>Skill ID</th>
	<th>Skill Name</th>
	<th>Trainee Name</th>
	<th>Trainee Email</th>
	<th>Trainee Phone Number</th>
	<th>acquired</th>
</tr>
<c:forEach items="${trainees}" var="trainee">
    <tr>
    	<td>${trainee.skillId}</td>
    	<td>${trainee.skillName}</td>
    	<td>${trainee.traineeName}</td>
    	<td>${trainee.traineeEmail}</td>
    	<td>${trainee.traineePhoneNumber}</td>
    	<td>${trainee.acquired}</td>
    	<td><a href="setCompleted?enrollmentId=${trainee.enrollmentId}&userId=${trainee.traineeId}">Set as Completed</a></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>