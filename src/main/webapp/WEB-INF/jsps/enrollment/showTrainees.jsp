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

<c:choose>
  <c:when test="${trainees.size() == 0}">
  	<p>You don't have any trainees yet.</p>
 </c:when>
 <c:otherwise>
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
    	<td><form action="setCompleted" method="post"><input type="text" name="enrollmentId" value="${trainee.enrollmentId}" HIDDEN />
    	<input type="submit" value="Set as completed" ${trainee.acquired==true ? 'disabled' : ''} /></form></td>
    </tr>
    </c:forEach>
</table>
 </c:otherwise>
</c:choose>
</body>
</html>