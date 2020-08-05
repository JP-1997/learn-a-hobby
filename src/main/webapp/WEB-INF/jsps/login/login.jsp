<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
.jumbotron {
    background-color: #f4511e;
    color: #fff;
    padding: 100px 25px;
    font-family: Montserrat, sans-serif;
  }
h2 {
    font-size: 24px;
    text-transform: uppercase;
    color: #303030;
    font-weight: 600;
    margin-bottom: 30px;
  }
  .loginfooter {
	background-color: #f4511e;
    letter-spacing: 4px;
    border-radius: 0;
	width: 100%;
	box-sizing: border-box;
	padding: 14px 16px;
	width: 100%;
	align-self: stretch;
}
.loginfooter a {
    color: #fff !important;
    float: center;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  border: 1px solid #f4511e;
  display: inline-block;
  width: 100%;
  height: 100%;
  align-self: stretch;
  }
  .loginfooter a:hover{
    color: #f4511e !important;
    background-color: #fff !important;
  }
</style>
<title>User Login</title>
</head>
<body>

<div class="jumbotron text-center">
  <h1>Learn-A-Hobby</h1> 
  <p>Learn or Teach your fav hobby !</p> 
</div>

<h2 class="text-center">Login</h2><br />
<form class="form-horizontal" action="performLogin" method="post">
<div class="form-group">
  <label class="col-md-4 control-label">E-Mail</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="email" placeholder="Enter your email" class="form-control"  type="email">
    </div>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" >Password</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="password" name="password"  placeholder="Enter your password" class="form-control">
    </div>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4"><br>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit" class="btn btn-warning" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspLOGIN <span class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
  </div>
</div>
${msg}
</form>
<div class="loginfooter">
	<a href="showReg">Not a member? Click here to register.</a>
</div>

</body>
</html>