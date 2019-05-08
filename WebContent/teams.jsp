<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException,com.zubiri.football.*,java.util.ArrayList"%>
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
				conn.updateTeam(request.getParameter("old_name"),
						new Team(request.getParameter("new_name"), request.getParameter("coach")));
			}

			if (request.getParameter("insert") != null) {
				conn.insertTeam(new Team(request.getParameter("name"), request.getParameter("coach")));
			}

			ArrayList<Team> teams = conn.selectAllTeams2();
			String teamsList = "";
			for (int i = 0; i < teams.size(); i++) {
				teamsList = teamsList + "<form action='manageTeam.jsp' method='POST'>" + teams.get(i).getTeamName()
						+ "&nbsp;&nbsp;" + teams.get(i).getCoach() + "&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "<input type='submit' value='Update' name='update'><input type='submit' value='Delete' name='delete'><input type='hidden' name='old_name' value='"
						+ teams.get(i).getTeamName() + "'>" + "</form>" + "<br>";
			}
		%>
	</p>
	<p><%=teamsList%></p>
	<form action='manageTeam.jsp' method='POST'>
		<input type='submit' value='Insert a team' name='insert'>
	</form>
	<br>
	<br>
	<a href="football.jsp">Go back</a>
</body>
</html>