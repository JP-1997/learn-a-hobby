<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enroll</title>
</head>
<body>
<table>
<tr>
<td>ID:<td>
<td>${skill.id}</td>
</tr>
<tr>
<td>NAME:<td>
<td>${skill.name}</td>
</tr>
<tr>
<td>DESCRIPTION:<td>
<td>${skill.description}</td>
</tr>
<tr>
<td>INSTRUCTOR'S NAME:<td>
<td>${skill.instructorName}</td>
</tr>
<tr>
<td>FEE:<td>
<td>${skill.fee}</td>
</tr>
<tr>
<td>RATING:<td>
<td>${skill.rating}</td>
</tr>
<tr>
<td>STUDENTS SO FAR: <td>
<td>${skill.studentsSoFar}</td>
</tr>
</table>

<c:choose>
  <c:when test="${skill.fee != 0.0}">
  	<a href="showCheckout?skillId=${skill.id}">Proceed to Checkout</a>
 </c:when>
 <c:otherwise>
   <a href="enrollment/enroll">Enroll</a>
 </c:otherwise>
</c:choose>

</body>
</html>