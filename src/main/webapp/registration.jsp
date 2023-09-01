<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<link href="./css/register1.css" rel="stylesheet" />
<link href="./css/google-font.css" rel="stylesheet" />
<link href="./css/mdb.css" rel="stylesheet" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.1/mdb.min.js"></script>
</head>
<body>
	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div class="row justify-content-center align-items-center h-100">
				<div class="col-12 col-lg-9 col-xl-7">
					<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<div class="card-body p-4 p-md-5">
							<h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registration Form</h3>
							<form action="Register" method="post">

								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="text" name="name" id="firstName"
												class="form-control form-control-lg" /> <label
												class="form-label" for="firstName">First Name</label>
										</div>

									</div>
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="text" name="pass" id="lastName"
												class="form-control form-control-lg" /> <label
												class="form-label" for="lastName">Last Name</label>
										</div>

									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 d-flex align-items-center">

										<div class="form-outline datepicker w-100">
											<input type="text" name="dob"
												class="form-control form-control-lg" id="birthdayDate" /> <label
												for="birthdayDate" class="form-label">Birthday</label>
										</div>

									</div>
									<div class="col-md-6 mb-4">

										<h6 class="mb-2 pb-1">Gender:</h6>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gender"
												id="femaleGender" value="option1" checked /> <label
												class="form-check-label" for="femaleGender">Female</label>
										</div>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gender"
												id="maleGender" value="option2" /> <label
												class="form-check-label" for="maleGender">Male</label>
										</div>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gender"
												id="otherGender" value="option3" /> <label
												class="form-check-label" for="otherGender">Other</label>
										</div>

									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<input type="email" name="email" id="emailAddress"
												class="form-control form-control-lg" /> <label
												class="form-label" for="emailAddress">Email</label>
										</div>

									</div>
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<input type="tel" name="phone" id="phoneNumber"
												class="form-control form-control-lg" /> <label
												class="form-label" for="phoneNumber">Phone Number</label>
										</div>

									</div>
								</div>

								<div class="mt-4 pt-2">
									<input class="btn btn-primary btn-lg" type="submit"
										value="Submit" />
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>