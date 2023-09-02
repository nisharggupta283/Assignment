<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<link href="./css/register1.css" rel="stylesheet" />
<link href="./css/google-font.css" rel="stylesheet" />
<link href="./css/bootstrap.min.css">
<link href="./css/mdb.css" rel="stylesheet" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.1/mdb.min.js"></script>
<script type="text/javascript" src="./javascript/jquery.js"></script>
<script type="text/javascript">
	var nameArray = [ "", "" ];
	function nameCorrector(e, flag) {
		if (flag) {
			nameArray[0] = e.value;
		} else {
			nameArray[1] = e.value;
		}
		$(`#name`).val(`${nameArray[0]} ${nameArray[1]}`);
	}
	function isValidPassword(e, id) {
		const specialChars = /[`!@#$%^&*()_\-+=\[\]{};':"\\|,.<>\/?~ ]/;
		let message = "";
		if ($(`#${id}`).val() != e.value) {
			message = "Password Mismatch Please Check";
		} else if (e.value.length < 8
				|| $(`#${id}`).val().length<8 || e.value.length>12
				|| $(`#${id}`).val().length > 12) {
			message = "Password length should be greater than 8 and less than 12";
		} else if (!specialChars.test(e.value)) {
			message = "Password should contain special character";
		}

		$(`#err-div2`).hide();
		$(`#err-div1`).hide();
		if (message) {
			$(`#err-div2`).text(message);
			$(`#err-div1`).text(message);
			$(`#err-div1`).show();
			$(`#err-div2`).show();
			return false;
		}
		return true;
	}
	function callHideDiv(id) {
		$(`#${id}`).hide();
	}
	function save() {
		const flag = isValidPassword(document.getElementById('pass'), document
				.getElementById('confirm-pass'));
		if (flag) {
			document.getElementById("register-form").submit();
		}
	}
</script>
</head>
<body>

	<section class="vh-100 gradient-custom" id="has-to-blur">
		<div class="container py-5 h-100">



			<div class="row justify-content-center align-items-center h-100">
				<div class="col-12 col-lg-9 col-xl-7">
					<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<div class="card-body p-4 p-md-5">
							<h3 class="mb-4 pb-2 pb-md-0 mb-md-5">
								Update Detail for User
								<%=request.getAttribute("username") + " {" + request.getAttribute("id") + "}"%></h3>
							<form action="UpdateS?id=<%=request.getParameter("id")%>"
								method="post" id="register-form">
								<input type="hidden" name="name" id="name">
								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="text" onkeyup="nameCorrector(this,true);"
												id="firstName" class="form-control form-control-lg" />
											<label class="form-label" for="firstName">First Name</label>
										</div>

									</div>
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<input type="text" onkeyup="nameCorrector(this,false);"
												id="lastName" class="form-control form-control-lg" />
											<label class="form-label" for="lastName">Last Name</label>
										</div>

									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 d-flex align-items-center">

										<div class="form-outline datepicker w-100">
											<input type="text" name="dob"
												class="form-control form-control-lg" id="birthdayDate" />
											<label for="birthdayDate" class="form-label">Birthday</label>
										</div>

									</div>
									<div class="col-md-6 mb-4">

										<h6 class="mb-2 pb-1">Gender:</h6>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gender"
												id="femaleGender" value="Female" checked /> <label
												class="form-check-label" for="femaleGender">Female</label>
										</div>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gender"
												id="maleGender" value="Male" /> <label
												class="form-check-label" for="maleGender">Male</label>
										</div>

										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gender"
												id="otherGender" value="Other" /> <label
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
								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<input type="password" name="pass" id="pass"
												class="form-control form-control-lg"
												onkeyup="isValidPassword(this,'pass')" required="required" />
											<label class="form-label" for="emailAddress">Password</label>
										</div>
										<div class="alert alert-danger" role="alert" id="err-div1"
											style="display: none;"></div>
									</div>
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<input type="password" id="confirm-pass"
												class="form-control form-control-lg"
												onkeyup="isValidPassword(this,'confirm-pass')" /> <label
												class="form-label" for="confirm-pass">Confirm
												Password</label>
										</div>
										<div class="alert alert-danger" role="alert" id="err-div2"
											style="display: none;"></div>
									</div>
								</div>
								<div class="mt-4 pt-2">
									<input class="btn btn-primary btn-lg" type="submit"
										value="Submit" onclick="save()" />
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