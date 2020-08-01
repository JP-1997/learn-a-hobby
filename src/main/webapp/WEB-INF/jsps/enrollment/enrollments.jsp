<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>enrollments</title>
</head>
<body>
<table>
<tr>
<th>ID</th>
<th>Skill Name</th>
<th>Instructor's Name</th>
<th>Date Enrolled</th>
<th>Acquired</th>
<th>Payment Details</th>
</tr>
<c:forEach items="${enrollments}" var="enrollment">
    <tr>
    	<td>${enrollment.id}</td>
    	<td>${enrollment.skillName}</td>
    	<td>${enrollment.instructorName}</td>
    	<td>${enrollment.dateEnrolled}</td>
    	<td>${enrollment.acquired}</td>
    	<td>${enrollment.paymentDetails}</td>
    	<td><form action="contactInstructor" method="post"><input type="text" name="enrollmentId" value="${enrollment.id}" HIDDEN />
    	<input type="submit" value="Contact Instructor" /></form></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>