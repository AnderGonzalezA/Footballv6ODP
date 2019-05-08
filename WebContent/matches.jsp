<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException,com.zubiri.football.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Matches</title>
</head>
<body>
	<h1>Matches</h1>
	<p>
		<%
			Conn conn = new Conn();

			if (request.getParameter("update") != null) {
				conn.updateMatch(Integer.parseInt(request.getParameter("id")),new FootballMatch(request.getParameter("local_team"),
						Integer.parseInt(request.getParameter("local_goals")), request.getParameter("visitor_team"),
						Integer.parseInt(request.getParameter("visitor_goals"))));
			}

			if (request.getParameter("insert") != null) {
				conn.insertMatch(new FootballMatch(request.getParameter("local_team"),
						Integer.parseInt(request.getParameter("local_goals")), request.getParameter("visitor_team"),
						Integer.parseInt(request.getParameter("visitor_goals"))));
			}

			ArrayList<FootballMatch> footballMatches = conn.selectAllMatches2();
			String footballMatchesList = "";
			for (int i=0;i<footballMatches.size();i++) {
				int id = footballMatches.indexOf(footballMatches.get(i))+1;
				footballMatchesList = footballMatchesList + "<form action='manageMatch.jsp' method='POST'>" + footballMatches.get(i).getLocalTeam().getTeamName()
						+ "&nbsp;&nbsp;" + footballMatches.get(i).getGoalsLocal() + "&nbsp;&nbsp;" + footballMatches.get(i).getVisitorTeam() + "&nbsp;&nbsp;"
						+ footballMatches.get(i).getGoalsVisitor() + "&nbsp;&nbsp;"
						+ "<input type='submit' value='Update' name='update'><input type='submit' value='Delete' name='delete'><input type='hidden' name='id' value='"
						+ id + "'>" + "</form>" + "<br>";
			}
		%>
	</p>
	<p><%=footballMatchesList%></p>
	<form action='manageMatch.jsp' method='POST'>
		<input type='submit' value='Insert a match' name='insert'>
	</form>
	<br>
	<br>
	<a href="football.jsp">Go back</a>
</body>
</html>