<%@page import="java.util.ArrayList"%>
<%@page import="com.infoes.LoginInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
List<LoginInfo> list = null;
if (request.getAttribute("UserList") != null)
	list = ((ArrayList<LoginInfo>) (request.getAttribute("UserList")));
System.out.println(list);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>See List</title>
<link rel="stylesheet" href="./css/tables-style.css" />
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/autocomplete.css" />
<script src="./javascript/myJS.js"></script>
<script src="./javascript/autocomplete.js"></script>
<script src="./javascript/autocomplete-ui.js"></script>
<script>
	
</script>
</head>

<body>
	<div class="toast align-items-center" role="alert"
		aria-live="assertive" aria-atomic="true" id="role">
		<div class="d-flex">
			<div class="toast-body" id="message">
			</div>
			<button type="button" class="btn-close me-2 m-auto"
				data-bs-dismiss="toast" aria-label="Close" onclick="hideTheBar()"></button>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col my-5">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active" id="you"
						aria-current="page" href="javascript:void(0)"
						onclick="callChangeDiv('you',1)">List of Users</a></li>
					<li class="nav-item"><a class="nav-link" id='me'
						href="javascript:void(0)" onclick="callChangeDiv('me',2)">Get
							Single User Data</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container" id="see-entire-list">
		<div class="row">
			<div class="col">
				<div class="container">
					<div class="row">
						<div class="col-4 my-5" style="width: 14.333333%">
							<select class="form-select" aria-label="Default select example"
								id="select-filter">
								<option selected></option>
								<option value="NAME">NAME</option>
								<option value="ID">ID</option>
								<option value="PHONE">PHONE</option>
								<option value="DOB">DOB</option>
								<option value="EMAIL">EMAIL</option>
							</select>
						</div>
						<div class="col-4 my-5" style="width: 28.333333%">
							<input class="form-control mr-sm-2" type="search"
								id="filter-input" placeholder="Filter Record"
								aria-label="Search"
								onkeyup="callAutoFillMethod(this,'select-filter');" />
						</div>
					</div>
				</div>
				<div class="text-center">
					<div class="row align-items-center">
						<div class="col">
							<table class="styled-table" id="to-append">
								<thead>
									<tr>
										<!--Header  -->
										<th>NAME</th>
										<th>ID</th>
										<th>PHONE</th>
										<th>DOB</th>
										<th>EMAIL</th>
										<th>UPDATE</th>
										<th>DELETE</th>
									</tr>
								</thead>
								<tbody id="to-delete">
									<%
									String count = "";
									if (list != null) {
										for (int i = 1; i < list.size(); i++) {
											count = count == "active-row" ? "" : "active-row";
											LoginInfo loginInfo = list.get(i);
									%>
									<tr class="<%=count%>" id="tr<%=loginInfo.getUserID()%>">
										<td><%=loginInfo.getName()%></td>
										<td><%=loginInfo.getUserID()%></td>
										<td><%=loginInfo.getPhone()%></td>
										<td><%=loginInfo.getDob()%></td>
										<td><%=loginInfo.getEmail()%></td>
										<td><button type="button" class="btn btn-success"
												onclick="goToPage(<%=loginInfo.getUserID()%>)">Update</button></td>
										<td><button type="button" class="btn btn-danger"
												onclick="callDelete(this);"
												value="<%=loginInfo.getUserID()%>"
												id="<%=loginInfo.getUserID()%>">Delete</button></td>
									</tr>
									<%
									}
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- 				<div class="container text-center">
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4 offset-md-4">
							<nav aria-label="...">
								<ul class="pagination">
									<li class="page-item disabled" id="previous"><a
										class="page-link" href="javascript:void(0)" tabindex="-1"
										onclick="callPrevPage()">Previous</a></li>
									<li class="page-item"><a class="page-link"
										href="javascript:void(0)" onclick="callNextPage()">Next</a></li>
									<li class="page-item disabled"><a class="page-link"
										href="javascript:void(0)" id="page-no"></a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div> -->
			</div>
		</div>
	</div>

	<div class="container" id="see-single-list" style="display: none;">
		<div class="container">
			<div class="row">
				<div class="col-4 my-5" style="width: 14.333333%">
					<select class="form-select" aria-label="Default select example"
						id="single-filter">
						<option selected value=""></option>
						<option value="ID">ID</option>
						<option value="NAME">NAME</option>
						<option value="PHONE">PHONE</option>
						<option value="DOB">DOB</option>
						<option value="EMAIL">EMAIL</option>
					</select>
				</div>
				<div class="col-4 my-5" style="width: 28.333333%">
					<input class="form-control mr-sm-2" type="search"
						id="filter-input2" placeholder="Filter Record" aria-label="Search"
						onkeyup="callAutoFillMethod(this,'single-filter');">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="container bootstrap snippets bootdey">
					<div class="panel-body inf-content">
						<div class="row">
							<div class="col-md-4">
								<img alt="" style="width: 600px;" title=""
									class="img-circle img-thumbnail isTooltip"
									src="https://bootdey.com/img/Content/avatar/avatar7.png"
									data-original-title="Usuario">
								<ul title="Ratings" class="list-inline ratings text-center">
									<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
									<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
									<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
									<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
									<li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
								</ul>
							</div>
							<div class="col-md-6">
								<br>
								<div class="table-responsive">
									<table class="table table-user-information">
										<tbody>
											<tr>
												<td><strong> <span
														class="glyphicon glyphicon-asterisk text-primary"></span>
														ID
												</strong></td>
												<td class="text-primary" id="ID"></td>
											</tr>
											<tr>
												<td><strong> <span
														class="glyphicon glyphicon-user  text-primary"></span>
														NAME
												</strong></td>
												<td class="text-primary" id="NAME"></td>
											</tr>
											<tr>
												<td><strong> <span
														class="glyphicon glyphicon-cloud text-primary"></span>
														PHONE
												</strong></td>
												<td class="text-primary" id="PHONE"></td>
											</tr>

											<tr>
												<td><strong> <span
														class="glyphicon glyphicon-bookmark text-primary"></span>
														DOB
												</strong></td>
												<td class="text-primary" id="DOB"></td>
											</tr>


											<tr>
												<td><strong> <span
														class="glyphicon glyphicon-eye-open text-primary"></span>
														EMAIL
												</strong></td>
												<td class="text-primary" id="EMAIL"></td>
											</tr>
											<tr>
												<td onclick="goToPage()" id="update"><strong>
														<span class="glyphicon glyphicon-calendar text-primary"></span>
														UPDATE
												</strong></td>
												<td class="text-primary" id="update"></td>
											</tr>
											<tr>
												<td onclick="callDelete(this);" id="delete"><strong>
														<span class="glyphicon glyphicon-calendar text-primary"></span>
														DELETE
												</strong></td>
												<td class="text-primary" id="delete"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$("#to-append tr td").click(function() {
		//Reset
		$("#to-append td").removeClass("highlight");
		//Add highlight class to new column
		var index = $(this).index();
		$("#to-append tr").each(function(i, tr) {
			$(tr).find("td").eq(index).addClass("highlight");
		});
	});
</script>
</html>
