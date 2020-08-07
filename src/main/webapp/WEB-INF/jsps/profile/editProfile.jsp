<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js"></script>
<meta charset="ISO-8859-1">
<style>
.navbar {
    margin-bottom: 0;
    background-color: #f4511e;
    z-index: 9999;
    border: 0;
    font-size: 12px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
    font-family: Montserrat, sans-serif;
  }
.navbar li a, .navbar .navbar-brand {
    color: #fff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
    color: #f4511e !important;
    background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
  }
  .profileheading{
  padding-top: 60px;
  text-align: center;
  }
    .neomorphism{
  	width: 85%;
  	margin: 0 auto;
  	border-radius: 16px;
	background: #ffffff;
	box-shadow:  10px 10px 21px #8a8a8a, 
             -10px -10px 21px #ffffff;
    font-family: Montserrat, sans-serif;
    padding: 30px;
    padding-top: 50px;
  }
</style>
<script>
$(document).ready(function() {
    $('#editProfile_form').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            firstName: {
                validators: {
                        stringLength: {
                        min: 2,
                    },
                        notEmpty: {
                        message: 'Please enter your First Name'
                    }
                }
            },
             lastName: {
                validators: {
                     stringLength: {
                        min: 2,
                    },
                    notEmpty: {
                        message: 'Please enter your Last Name'
                    }
                }
            },
			 date: {
                validators: {
                    notEmpty: {
                        message: 'Please enter your Date of Birth'
                    }
                }
            },
            country: {
                validators: {
                    notEmpty: {
                        message: 'Please enter your Country'
                    }
                }
            },
			 password: {
                validators: {
                     stringLength: {
                        min: 7,
                    },
                    notEmpty: {
                        message: 'Please enter your Password'
                    }
                }
            },
			confirmPassword: {
                validators: {
                     stringLength: {
                        min: 7,
                    },
                    notEmpty: {
                        message: 'Please confirm your Password'
                    },
					identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'Please enter your Email Address'
                    },
                    emailAddress: {
                        message: 'Please enter a valid Email Address'
                    }
                }
            },
            phoneNumber: {
                validators: {
                  stringLength: {
                        min: 10, 
                        max: 15,
                    notEmpty: {
                        message: 'Please enter your Contact No.'
                     }
                }
            },
                }
            }
        })
        .on('success.form.bv', function(e) {
            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                $('#editProfile_form').data('bootstrapValidator').resetForm();

            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(result) {
                console.log(result);
            }, 'json');
        });
});
</script>
<title>Edit User Details</title>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="navbar-header">
      <a class="navbar-brand" href="showDashboard">Learn-A-Hobby</a>
    </div>
</nav>
<h2 class="profileheading">Edit User Details</h2><br />

<div class="neomorphism">
<form class="form-horizontal" action="updateProfile" method="post" id="editProfile_form">

<div class="form-group">
  <label class="col-md-4 control-label">User ID</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input class="form-control" name="id" value="${userDetails.id}" READONLY  type="text"/>
   </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">First Name</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input class="form-control" name="firstName" value="${userDetails.firstName}"  type="text"/>
   </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">Last Name</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input class="form-control" name="lastName" value="${userDetails.lastName}"  type="text"/>
   </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" >Date of birth</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
  <input type="date" name="dateOfBirth" value="<fmt:formatDate value="${userDetails.dateOfBirth}" pattern="yyyy-MM-dd" />" class="form-control"/>
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" >Gender</label> 
   <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    	<label class="radio-inline"><input type="radio" name="gender" value="male" ${userDetails.gender=='male' ? 'checked' : ''} />Male</label>
    	<label class="radio-inline"><input type="radio" name="gender" value="female" ${userDetails.gender=='female' ? 'checked' : ''} />Female</label>
    	<label class="radio-inline"><input type="radio" name="gender" value="not_specified" ${userDetails.gender=='not_specified' ? 'checked' : ''}/>Not Specified</label>
    	</div>
    </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" >Country</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>
  <input type="text" name="country" value="${userDetails.country}" class="form-control" /> 
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" >Phone Number</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  <input type="text" name="phoneNumber" value="${userDetails.phoneNumber}" class="form-control" /> 
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">E-Mail</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="email" value="${userDetails.email}" READONLY class="form-control"  type="email">
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4"><br>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit" class="btn btn-warning" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSAVE <span class="glyphicon glyphicon-floppy-save"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
  </div>
</div>

</form>
</div>
</body>
</html>