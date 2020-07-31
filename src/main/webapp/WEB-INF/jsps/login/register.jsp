<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register User</title>
</head>
<body>
<h2>User Registration:-</h2><br />
<form action="registerUser" method="post">
<pre>
First Name: <input type="text" name="firstName" />
Last Name: <input type="text" name="lastName" />
Date of birth: <input type="date" name="dateOfBirth" />
Gender:	
	Male<input type="radio" name="gender" value="male"/>  Female <input type="radio" name="gender" value="female"/> Not Specified <input type="radio" name="gender" value="not_specified"/>
Country: <input type="text" name="country" /> 
Phone Number: <input type="text" name="phoneNumber" /> 
Email: <input type="email" name="email" />
Password: <input type="password" name="password" />
Confirm Password: <input type="password" name="confirmPassword" />
<input type="submit" value="register" />
</pre>
</form>
Already a member?<a href="showLogin">Click here</a> to go to the login page.
</body>
</html>