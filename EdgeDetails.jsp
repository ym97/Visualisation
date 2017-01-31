<!DOCTYPE html>
<%@include file="connectionString.jsp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Edge Details</title>

<!-- CSS -->
<style>
body {
	background-image: url("formbg.jpg");
	background-repeat: no-repeat;
}

.myForm {
	background-opacity: 0.2;
	font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
	font-size: 0.8em;
	padding: 1em;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.myForm * {
	box-sizing: border-box;
}

.myForm label {
	font-size: 0.9em;
}

.myForm .audioOnly {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.myForm input {
	border-color: brown;
	border: 1px solid /* #ccc */;
	border-radius: 3px;
	font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
	font-size: 0.9em;
	padding: 0.5em;
}

div {
	align: centre;
	padding: 5px;
}

.myForm input {
	width: 12em;
}

h6 {
	font-size: 10px;
	color: white;
	font-family: Verdana;
}

.myForm button {
	padding: 0.7em;
	border-radius: 0.5em;
	background: #eee;
	border: none;
	font-weight: bold;
	margin-left: 1.5em;
}

.myForm button:hover {
	background: #ccc;
	cursor: pointer;
}
</style>

</head>
<body>
	<%
	String var = request.getParameter("param");
	
	//////////////////////// var has the id of the edge
	
	connectionString cs = new connectionString();
	String url = cs.url;
	String username = cs.username;
	String password = cs.password;

			try {

				Class.forName("org.postgresql.Driver");

			} catch (ClassNotFoundException e) {

				System.out.println("Where is your PostgreSQL JDBC Driver? " + "Include in your library path!");
				e.printStackTrace();
				return;

			}

			System.out.println("PostgreSQL JDBC Driver Registered!");

			java.sql.Connection connection = null;

			try {

				connection = DriverManager.getConnection(url, username, password);

			} catch (Exception e) {

				System.out.println("Connection Failed! Check output console");
				e.printStackTrace();
				return;

			}

			if (connection != null) {

			//	System.out.println("Before table");
				Statement s = connection.createStatement();
                String ins = "SELECT * FROM edge WHERE edge_id='"+var+"'";
				ResultSet ra = s.executeQuery(ins);
				System.out.println("done done ");
			} else {

				System.out.println("Failed to make connection!");

			}
	
	%>
	<form role="form" class="myForm" method="get"
		enctype="application/x-www-form-urlencoded" action="EdgeAddition.jsp">
		<!-- <div ><h6>EDGE DETAILS</h6> </div> -->
		<div class="form-group">
			<label class="audioOnly" for="edge_id">Edge ID</label> <input
				type="text" name="edge_id" required placeholder="Edge ID">
		</div>

		<div class="form-group">
			<label class="audioOnly" for="edge_name">Edge Name</label> <input
				type="text" name="edge_name" required placeholder="Edge Name">
		</div>

		<div class="form-group">
			<label class="audioOnly" for="building_name">Building Name</label> <input
				type="text" name="building_name" value ="lib" required
				placeholder="Building Name">
		</div>

		<div class="form-group">
			<label class="audioOnly" for="floor">Floor Number</label> <input
				type="number" name="floor" required placeholder="Floor Number">
		</div>

		<div class="form-group">
			<label class="audioOnly" for="start_node">Start Node</label> <input
				type="text" name="start_node" required placeholder="Start Node">
		</div>

		<div class="form-group">
			<label class="audioOnly" for="end_node">End Node</label> <input
				type="text" name="end_node" required placeholder="End Node">
		</div>


		<div class="form-group">
			<label class="audioOnly" for="capacity">Capacity</label> <input
				type="number" name="capacity" required placeholder="Capacity">
		</div>


		<div class="form-group">
			<label class="audioOnly" for="edge_length">Edge Length</label> <input
				type="number" name="edge_length" required placeholder="Edge Length">
		</div>

		<button>Save</button>

	</form>
	
	
	
	


</body>