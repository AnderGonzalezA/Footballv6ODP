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
		Team team = conn.selectTeam(request.getParameter("old_name"));
		text = "<title>Update a team</title></head><body><h1>Update a team</h1><form action='teams.jsp' method='POST'>"
				+ "<input type='hidden' value='" + team.getTeamName() + "' name='old_name'>"
				+ "<label>Team name</label>&nbsp;&nbsp;<input type='text' value='" + team.getTeamName()
				+ "' name='new_name'><br>" + "<label>Coach</label>&nbsp;&nbsp;<input type='text' value='"
				+ team.getCoach() + "' name='coach'><br>"
				+ "<input type='submit' value='Update' name='update'>" + "</form>";
	}
	if (request.getParameter("delete") != null) {
		conn.deleteTeam(request.getParameter("old_name"));
		response.redirect("teams.jsp");
		//response.setStatus(response.SC_MOVED_TEMPORARILY);
		//response.setHeader("Location", site);
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