<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>See List</title>
<link rel="stylesheet" href="./css/tables-style.css" />
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/autocomplete.css" />
<script src="./javascript/bootstrap.min.js"></script>
<script src="./javascript/myJS.js"></script>
<script src="./javascript/autocomplete.js"></script>
<script src="./javascript/autocomplete-ui.js"></script>
<script>
</script>
</head>

<body>

	<div class="container">
		<div class="row">
			<div class="col my-5">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Active</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
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
								<%
								for (int i = 0; i < 5; i++) {
								%>
								<option value="<%=i++%>"><%="Nisharg" + i%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="col-4 my-5" style="width: 28.333333%">
							<input class="form-control mr-sm-2" type="search"
								id="filter-input" placeholder="Filter Record"
								aria-label="Search" onkeyup="callAutoFillMethod(this);" />
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
										<%
										for (int i = 0; i < 6; i++) {
										%>
										<th><%="Header" + i%></th>
										<%
										}
										%>
									</tr>
								</thead>
								<tbody id="to-delete">
									<%
									String count = "";
									for (int i = 1; i < 6; i++) {
										count = count == "active-row" ? "" : "active-row";
									%>
									<tr class="<%=count%>">
										<%
										for (int k = 0; k < 8; k++) {
										%>
										<td><%="data" + k%></td>
										<%
										}
										%>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="container text-center">
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
				</div>
			</div>
		</div>
	</div>

	<div class="container" id="see-single-list">
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
								<strong>Information</strong><br>
								<div class="table-responsive">
									<table class="table table-user-information">
										<tbody>
											<tr>
												<td><strong> <span
														class="glyphicon glyphicon-asterisk text-primary"></span>
														Identificacion
												</strong></td>
												<td class="text-primary">123456789</td>
											</tr>
											<tr>
												<td><strong> <span
														class="glyphicon glyphicon-user  text-primary"></span>
														Name
												</strong></td>
												<td class="text-primary">Bootdey</td>
											</tr>
											<tr>
												<td><strong> <span
														class="glyphicon glyphicon-cloud text-primary"></span>
														Lastname
												</strong></td>
												<td class="text-primary">Bootstrap</td>
											</tr>

											<tr>
												<td><strong> <span
														class="glyphicon glyphicon-bookmark text-primary"></span>
														Username
												</strong></td>
												<td class="text-primary">bootnipets</td>
											</tr>


											<tr>
												<td><strong> <span
														class="glyphicon glyphicon-eye-open text-primary"></span>
														Role
												</strong></td>
												<td class="text-primary">Admin</td>
											</tr>
											<tr>
												<td><strong> <span
														class="glyphicon glyphicon-envelope text-primary"></span>
														Email
												</strong></td>
												<td class="text-primary">noreply@email.com</td>
											</tr>
											<tr>
												<td><strong> <span
														class="glyphicon glyphicon-calendar text-primary"></span>
														created
												</strong></td>
												<td class="text-primary">20 jul 20014</td>
											</tr>
											<tr>
												<td><strong> <span
														class="glyphicon glyphicon-calendar text-primary"></span>
														Modified
												</strong></td>
												<td class="text-primary">20 jul 20014 20:00:00</td>
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
