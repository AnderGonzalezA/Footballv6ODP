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
		ResultSet team = conn.selectTeam("old_name");
		try {
			if (team.next()) {
				text = "<title>Update a team</title></head><body><h1>Update a team</h1><form action='teams.jsp' method='POST'>"
						+ "<input type='hidden' value='" + team.getString(1) + "' name='old_name'>"
						+ "<label>Team name</label>&nbsp;&nbsp;<input type='text' value='" + team.getString(1)
						+ "' name='new_name'><br>"
						+ "<label>Coach</label>&nbsp;&nbsp;<input type='text' value='" + team.getString(2)
						+ "' name='coach'><br>" + "<input type='submit' value='Update' name='update'>"
						+ "</form>";
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	if (request.getParameter("delete") != null) {
		conn.deleteTeam("old_name");
		String site = new String("teams.jsp");
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", site);
	}
	if (request.getParameter("insert") != null) {
		text = "<title>Insert a team</title></head><body><h1>Insert a team</h1><form action='teams.jsp' method='POST'>"
				+ "<label>Team name</label>&nbsp;&nbsp;<input type='text' name='name'><br>"
				+ "<label>Coach</label>&nbsp;&nbsp;<input type='text' name='coach'><br>"
				+ "<input type='submit' value='Insert' name='insert'>" + "</form>";
	}
%>
<p><%=text%></p>
</body>
</html>