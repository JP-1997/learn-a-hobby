<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Profile</title>
</head>
<body>
<h2>My Profile</h2><hr />
<pre>
User Id: ${userDetails.id}
First Name: ${userDetails.firstName}
Last Name: ${userDetails.lastName}
Date of birth: <fmt:formatDate type = "date" value = "${userDetails.dateOfBirth}" />
Gender: ${userDetails.gender}
Country: ${userDetails.country}
Phone Number: ${userDetails.phoneNumber}
Email: ${userDetails.email}
<a href="showEditProfile">Edit</a>
<a href="showDeleteProfile">Delete Profile</a>
</pre>
</body>
</html>