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
		try {
			ResultSet player = conn.selectPlayer(request.getParameter("old_name"));
			if (player.next()) {
				text = "<title>Update a player</title></head><body><h1>Update a player</h1><form action='players.jsp' method='POST'>"
						+ "<input type='hidden' value='" + player.getString(1) + "' name='old_name'>"
						+ "<label>Name</label>&nbsp;&nbsp;<input type='text' value='" + player.getString(1)
						+ "' name='new_name'><br>" + "<label>Age</label>&nbsp;&nbsp;<input type='text' value='"
						+ player.getString(2) + "' name='age'><br>"
						+ "<label>Team name</label>&nbsp;&nbsp;<input type='text' value='" + player.getString(3)
						+ "' name='team_name'><br>" + "<input type='submit' value='Update' name='update'>"
						+ "</form>";
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	if (request.getParameter("delete") != null) {
		conn.deletePlayer(request.getParameter("old_name"));
		String site = new String("players.jsp");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);
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