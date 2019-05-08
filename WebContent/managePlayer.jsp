<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException,com.zubiri.football.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
	Conn conn = new Conn();

	String text = "";
	if (request.getParameter("update") != null) {
		FootballPlayer player = conn.selectPlayer(request.getParameter("old_name"));
		text = "<title>Update a player</title></head><body><h1>Update a player</h1><form action='players.jsp' method='POST'>"
				+ "<input type='hidden' value='" + player.getPlayerName() + "' name='old_name'>"
				+ "<label>Name</label>&nbsp;&nbsp;<input type='text' value='" + player.getPlayerName()
				+ "' name='new_name'><br>" + "<label>Age</label>&nbsp;&nbsp;<input type='text' value='"
				+ player.getAge() + "' name='age'><br>"
				+ "<label>Team name</label>&nbsp;&nbsp;<input type='text' value='" + player.getTeamName()
				+ "' name='team_name'><br>" + "<input type='submit' value='Update' name='update'>" + "</form>";
	}
	if (request.getParameter("delete") != null) {
		conn.deletePlayer(request.getParameter("old_name"));
		//response.setStatus(response.SC_MOVED_TEMPORARILY);
		//response.setHeader("Location", "players.jsp");
		response.sendRedirect("players.jsp");
	}
	if (request.getParameter("insert") != null) {
		text = "<title>Insert a player</title></head><body><h1>Insert a player</h1><form action='players.jsp' method='POST'>"
				+ "<label>Name</label>&nbsp;&nbsp;<input type='text' name='name'><br>"
				+ "<label>Age</label>&nbsp;&nbsp;<input type='text' name='age'><br>"
				+ "<label>Team name</label>&nbsp;&nbsp;<input type='text' name='team_name'><br>"
				+ "<input type='submit' value='Insert' name='insert'>" + "</form>";
	}
%>
<p><%=text%></p>
</body>
</html>