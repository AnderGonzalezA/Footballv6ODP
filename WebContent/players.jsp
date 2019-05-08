<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException,com.zubiri.football.*,java.util.ArrayList"%>
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
				conn.updatePlayer(request.getParameter("old_name"), new FootballPlayer(request.getParameter("new_name"),
						Integer.parseInt(request.getParameter("age")), request.getParameter("team_name")));
			}

			if (request.getParameter("insert") != null) {
				conn.insertPlayer(new FootballPlayer(request.getParameter("name"),
						Integer.parseInt(request.getParameter("age")), request.getParameter("team_name")));
			}

			ArrayList<FootballPlayer> players = conn.selectAllPlayers2();
			String playersList = "";
			for (int i = 0; i < players.size(); i++) {
				playersList = playersList + "<form action='managePlayer.jsp' method='POST'>"
						+ players.get(i).getPlayerName() + "&nbsp;&nbsp;" + players.get(i).getAge() + "&nbsp;&nbsp;"
						+ players.get(i).getTeamName() + "&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "<input type='submit' value='Update' name='update'><input type='submit' value='Delete' name='delete'><input type='hidden' name='old_name' value='"
						+ players.get(i).getPlayerName() + "'>" + "</form>" + "<br>";
			}
		%>
	</p>
	<p><%=playersList%></p>
	<form action='managePlayer.jsp' method='POST'>
		<input type='submit' value='Insert a player' name='insert'>
	</form>
	<br>
	<br>
	<a href="football.jsp">Go back</a>
</body>
</html>