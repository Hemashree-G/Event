<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.Enquiry"%>
<%@page import="model.Dproduct"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.container {
	max-width: 1500px;
	margin: auto;
	padding-left: 25px;
	padding-right: 25px;
}

.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	min-width: 1000px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	background: #35475e;
	color: #fff;
	padding: 16px 30px;
	min-width: 100%;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
	outline: none !important;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: white;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.cost {
	float: right;
	font-size: 25px;
	color: black;
	padding-top: 20px;
	padding-right: 300px;
}

.btn btn-warning {
	margin-top: 17px
}
</style>
</head>
<body class="container"
	style="background-color: #f1f8e9; font-style: inherit; color: rgb(99, 118, 84);">
	<form action='register' method='POST' id="bookevent">
		<div class="header">
			<div class="container">
				<%@include file="header.jsp"%>
			</div>
		</div>
		<%
		if (session.getAttribute("uname") != null) {
		%>
		<div class="container-xl">
			<div class="table-responsive">
				<div class="table-wrapper">
					<div class="table-title">
						<div class="row">
							<div class="col-sm-4">
								<h2>
									Manage <b>Events</b>
								</h2>
							</div>
						</div>
					</div>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>Image</th>
								<th>Name</th>
								<th>Cost</th>
								<th>Email</th>
								<th>Booked Date</th>
								<th>Event date</th>
								<th>Status</th>
								<th>Receipt</th>
								<th>Give Ratings</th>
							</tr>
						</thead>
						<tbody>
							<%
							Enquiry s1 = new Enquiry(session);
							ArrayList<Dproduct> ar = s1.geteventstatus();
							Iterator<Dproduct> itr = ar.iterator();
							while (itr.hasNext()) {
								Dproduct s = itr.next();
							%>
							<tr>
								<td><img src="<%=s.getP_image()%>" width="100px"
									height="100px"></td>
								<td><%=s.getP_name()%></td>
								<td><%=s.getP_cost()%></td>
								<td><%=s.getEmail()%></td>
								<td><%=s.getDate()%></td>
								<td><%=s.getEventdate()%></td>
								<%
								if (s.getStatus().equals("pending")) {
								%>
								<td style="color: blue">
									<form action="addtocart" method="post">
										<input type="hidden" name="event_id" value="<%=s.getP_id()%>" />
										<button type="submit" class="btn btn-danger"
											name="cancelevent">Cancel</button>
									</form>
								</td>
								<%
								} else if (s.getStatus().equals("booked")) {
								%>
								<td style="color: green">Booked</td>
								<td><a href="pdf.jsp">Download</a></td>
								<td><a href="review.jsp">Review</a></td>
								<%
								} else if (s.getStatus().equals("cancelled")) {
								%>
								<td style="color: red">Cancelled</td>
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
		<%
		}
		%>
	</form>
	<%@include file="footer.jsp"%>
</body>
</html>