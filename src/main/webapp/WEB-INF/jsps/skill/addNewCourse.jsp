<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add new course</title>
</head>
<body>
<h2>Add New Course</h2><hr />
<div>Enter course details:-</div>
<form action="addNewCourse" method="post">
<pre>
Name: <input type="text" name="name" />
Description: <input type="text" name="description" />
Fee: <input type="number" step="any" name="fee" />
<input type="submit" value="add course" />
</pre>
</form>
</body>
</html>