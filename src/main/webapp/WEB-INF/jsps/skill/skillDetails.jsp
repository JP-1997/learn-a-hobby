<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hobby Finder</title>
</head>
<body>
<table>
	<tr>
    	<th>ID</th>
    	<th>NAME</th>
    	<th>DESCRIPTION</th>
    	<th>INSTRUCTOR'S NAME</th>
    	<th>FEE</th>
    	<th>RATING</th>
    	<th>STUDENTS SO FAR</th>
    </tr>
  	<c:forEach items="${allSkills}" var="skill">
    <tr>
    	<td>${skill.id}</td>
    	<td>${skill.name}</td>
    	<td>${skill.description}</td>
    	<td>${skill.instructorName}</td>
    	<td>${skill.fee}</td>
    	<td>${skill.rating}</td>
    	<td>${skill.studentsSoFar}</td>
    	<td><a href="showEnroll?skillId=${skill.id}">Enroll</a></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>