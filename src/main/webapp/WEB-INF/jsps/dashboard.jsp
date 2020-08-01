<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333333;
}

li {
  float: right;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111111;
}
</style>
</head>
<body>
<header>
<ul>
	<li><a href="showProfile">My Profile</a></li>
</ul>
</header>
<p>Trending Skills:-</p>
<table>
  	<c:forEach items="${trendingSkills}" var="trendingSkill">
    <tr>
    	<td><a href="showSkillDetails?skillName=${trendingSkill}&userId=${userId}">${trendingSkill}</a></td>
    </tr>
    </c:forEach>
</table>

<p>My Skills:-</p>
<c:choose>
  <c:when test="${mySkills.size() != 0}">
  <table>
  	<c:forEach items="${mySkills}" var="mySkill">
    <tr>
    	<td>${mySkill}</td>
    </tr>
    </c:forEach>
 </table>
 </c:when>
 <c:otherwise>
   <p>No skills listed.</p>
 </c:otherwise>
</c:choose>
<a href="showLearn?userId=${userId}">Learn a new hobby !</a>
<a href="showTeach?userId=${userId}">Teach a new hobby !</a>
<a href="showTrainees">My Trainees</a>
<a href="showEnrollments">My Enrollments</a>
</body>
</html>