<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException,com.zubiri.football.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Players</title>
</head>
<body>
	<h1>Players</h1>
	<p>
		<%
			Conn conn = new Conn();

			if (request.getParameter("update") != null) {
				conn.updatePlayer(request.getParameter("old_name"), request.getParameter("new_name"),
						Integer.parseInt(request.getParameter("age")), request.getParameter("team_name"));
			}

			if (request.getParameter("insert") != null) {
				conn.insertPlayer(request.getParameter("name"), Integer.parseInt(request.getParameter("age")),
						request.getParameter("team_name"));
			}

			ResultSet result = conn.selectAllPlayers();
			String players = "";
			while (result.next()) {
				players = players + "<form action='managePlayer.jsp' method='POST'>" + result.getString(1)
						+ "&nbsp;&nbsp;" + result.getInt(2) + "&nbsp;&nbsp;" + result.getString(3)
						+ "&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "<input type='submit' value='Update' name='update'><input type='submit' value='Delete' name='delete'><input type='hidden' name='old_name' value='"
						+ result.getString(1) + "'>" + "</form>" + "<br>";
			}
		%>
	</p>
	<p><%=players%></p>
	<form action='managePlayer.jsp' method='POST'>
		<input type='submit' value='Insert a player' name='insert'>
	</form>
	<br>
	<br>
	<a href="football.jsp">Go back</a>
</body>
</html>