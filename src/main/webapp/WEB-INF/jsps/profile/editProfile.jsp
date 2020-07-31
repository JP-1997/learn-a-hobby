<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User Details</title>
</head>
<body>
<h2>Edit User Details</h2><hr />
<form action="updateProfile" method="post">
<pre>
User ID: <input type="text" name="id" value="${userDetails.id}" READONLY />
First Name: <input type="text" name="firstName" value="${userDetails.firstName}"/>
Last Name: <input type="text" name="lastName" value="${userDetails.lastName}"/>
Date of Birth: <input type="date" name="dateOfBirth" value="<fmt:formatDate value="${userDetails.dateOfBirth}" pattern="yyyy-MM-dd" />"/>
Gender:	
	Male<input type="radio" name="gender" value="male" ${userDetails.gender=='male' ? 'checked' : ''} />  Female <input type="radio" name="gender" value="female" ${userDetails.gender=='female' ? 'checked' : ''} /> Not Specified <input type="radio" name="gender" value="not_specified" ${userDetails.gender=='not_specified' ? 'checked' : ''}/>
Country: <input type="text" name="country" value="${userDetails.country}"/>
Phone Number: <input type="text" name="phoneNumber" value="${userDetails.phoneNumber}"/>
Email: <input type="email" name="email" value="${userDetails.email}" READONLY/>
<input type="submit" value="save" />
</pre>
</form>
</body>
</html>