<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
</head>
<body>
<form action="enroll" method="post">
<p>Amount to pay: ${skill.fee}</p>
Select Payment Option:	
	UPI<input type="radio" name="paymentGateway" value="UPI"/>
	RazorPay <input type="radio" name="paymentGateway" value="RazorPay"/> 
	Paypal <input type="radio" name="paymentGateway" value="Paypal"/>
	Stripe <input type="radio" name="paymentGateway" value="Stripe"/>
	<input type="text" name="skillId" value="${skill.id}" hidden/>
<input type="submit" value="Proceed to Pay" />
</form>
</body>
</html>