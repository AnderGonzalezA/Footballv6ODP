<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException,com.zubiri.football.*"%>
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
				conn.updateMatch(request.getParameter("local_team"),
						Integer.parseInt(request.getParameter("local_goals")), request.getParameter("visitor_team"),
						Integer.parseInt(request.getParameter("visitor_goals")));
			}

			if (request.getParameter("insert") != null) {
				conn.insertMatch(request.getParameter("local_team"),
						Integer.parseInt(request.getParameter("local_goals")), request.getParameter("visitor_team"),
						Integer.parseInt(request.getParameter("visitor_goals")));
			}

			ResultSet result = conn.selectAllMatches();
			String matches = "";
			while (result.next()) {
				matches = matches + "<form action='manageMatch.jsp' method='POST'>" + result.getString(2)
						+ "&nbsp;&nbsp;" + result.getInt(3) + "&nbsp;&nbsp;" + result.getString(4) + "&nbsp;&nbsp;"
						+ result.getInt(5) + "&nbsp;&nbsp;"
						+ "<input type='submit' value='Update' name='update'><input type='submit' value='Delete' name='delete'><input type='hidden' name='id' value='"
						+ result.getInt(1) + "'>" + "</form>" + "<br>";
			}
		%>
	</p>
	<p><%=matches%></p>
	<form action='manageMatch.jsp' method='POST'>
		<input type='submit' value='Insert a match' name='insert'>
	</form>
	<br>
	<br>
	<a href="football.jsp">Go back</a>
</body>
</html>