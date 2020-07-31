<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Profile</title>
</head>
<body>
<p>Are you sure you want to delete your profile ?<br />
All your achievement as well as your current enrollments info will be deleted.<br />
Note that this action cannot be undone !<br />
</p>
<form action="deleteProfile">
To delete your account enter "CONFIRM" and click delete.<br />
<input type="text" id="deleteCheck"  onkeyup="stoppedTyping()" /> 
<input type="submit" id="deleteButton" value="DELETE" disabled />
<script type="text/javascript">
function stoppedTyping(){
var i = document.getElementById("deleteCheck");
if(i.value != "CONFIRM")
    {
    document.getElementById("deleteButton").disabled=true;
    }
else
    document.getElementById("deleteButton").disabled=false;
}
</script>
</form>
</body>
</html>