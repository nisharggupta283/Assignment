<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/login.css">
<script src="./javascript/font-awesome.js"></script>
<script type="text/javascript">
	function togglePassword(e) {
		const password = document.querySelector('#id_password');
		const type = password.getAttribute('type') === 'password' ? 'text'
				: 'password';
		const classValue = e.className == 'fa-solid fa-eye-low-vision' ? 'fa-regular fa-eye'
				: 'fa-solid fa-eye-low-vision';
		password.setAttribute('type', type);
		e.setAttribute('class', classValue);
	}
</script>
</head>

<body>
	<section class="Form my-4 mx-5">
		<div class="container">
			<div class="row no-gutters">
				<div class="col-lg-5">
					<img src="./images/login.jpeg" alt="Not found" class="img-fluid">
				</div>
				<div class="col-lg-7 px-5 pt-5">
					<h1
						style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;"
						class="font-weight-bold">Registration Page for Employee</h1>
					<h4>Sign in into your Account</h4>
					<form action="/login" method="Post">
						<div class="form-row">
							<div class="col-lg-7">
								<input style="padding: 0.5rem;" type="email" placeholder="Email-Address"
									class="form-control my-3" name="email">
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-7">
								 <input type="password" name="password"
									autocomplete="current-password" required id="id_password" class="form-control" style="margin-bottom: -2rem">
									<i class="far fa-eye" id="togglePassword"
									style="margin-left: 90%; cursor: pointer;" onclick="togglePassword(this);"></i>
							
							</div>
						</div>
						<div class="form-row my-3">
							<div class="col-lg-7">
								<input type="submit" class="btn1 mt3 mb-5">
							</div>
						</div>
					</form>
					<p>
						Don't have Account? <a href="registration.jsp">Register Here</a>
					</p>
				</div>
			</div>
		</div>
	</section>
</body>
</html>