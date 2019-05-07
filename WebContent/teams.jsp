<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException,com.zubiri.football.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teams</title>
</head>
<body>
	<h1>Teams</h1>
	<p>
		<%
			Conn conn = new Conn();

			if (request.getParameter("update") != null) {
				conn.updateTeam(request.getParameter("new_name"), request.getParameter("coach"),
						request.getParameter("old_name"));
			}

			if (request.getParameter("insert") != null) {
				conn.insertTeam(request.getParameter("name"), request.getParameter("coach"));
			}

			ResultSet result = conn.selectAllTeams();
			String teams = "";
			while (result.next()) {
				teams = teams + "<form action='manageTeam.jsp' method='POST'>" + result.getString(1) + "&nbsp;&nbsp;"
						+ result.getString(2) + "&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "<input type='submit' value='Update' name='update'><input type='submit' value='Delete' name='delete'><input type='hidden' name='old_name' value='"
						+ result.getString(1) + "'>" + "</form>" + "<br>";
			}
		%>
	</p>
	<p><%=teams%></p>
	<form action='manageTeam.jsp' method='POST'>
		<input type='submit' value='Insert a team' name='insert'>
	</form>
	<br>
	<br>
	<a href="football.jsp">Go back</a>
</body>
</html>