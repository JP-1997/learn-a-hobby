<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>error</title>
<style>
.jumbotron {
	background-color: #f4511e;
	color: #fff;
	padding: 100px 25px;
	font-family: Montserrat, sans-serif;
}

.errormessage {
	border-radius: 2px;
	background: #ffffff;
	box-shadow: 10px 10px 21px #8a8a8a, -10px -10px 21px #ffffff;
	border: 1px solid #f4511e;
	font-size: 16px !important;
	line-height: 1.42857143 !important;
	letter-spacing: 4px;
	font-family: Montserrat, sans-serif;
	width: 80%;
	margin: 0 auto;
	padding: 16px;
}
.BackToHomeButton{
	 margin: auto;
  width: 100%;
  align-items: center;
  display: inline-block;
  text-align: center;
  padding: 20px;
}
</style>
</head>
<body>
	<div class="jumbotron text-center">
		<h1>Learn-A-Hobby</h1>
		<p>Learn or Teach your fav hobby !</p>
	</div>
	<div class="errormessage">
		<h1>Oops ! Something Went Wrong. Sorry for the inconvenience.</h1><br />
		<div class="BackToHomeButton">
		<a href="/learnahobby/showDashboard"><button type="submit"
				class="btn btn-primary">
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspBACK TO HOME&nbsp&nbsp<span
					class="glyphicon glyphicon-home"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			</button></a>
		</div>
	</div>
</body>
</html>