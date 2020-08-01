<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>search hobby</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
    $( "#hint" ).autocomplete({
      source: "autocomplete",
      minLength: 1
    });
  } );
</script>
</head>
<body>
<h2>Learn a new hobby</h2><hr />
<form action="showSkillDetails" method="post">
<input type="text" name="userId" value="${userId}" hidden />
Search a hobby: <input type="text" id="hint" name="skillName" />
<input type="submit" name="submit" value="Search" />
</form>
</body>
</html>