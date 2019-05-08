package com.zubiri.football;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Conn {
	private Connection conn;

	public Conn() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");

		String oracleURL = "jdbc:mysql://localhost/football?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

		this.conn = DriverManager.getConnection(oracleURL, "dw18", "dw18");
	}

	public void insertPlayer(String name, int age, String team_name) throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("insert into players values(?,?,?);");

		pst.setString(1, name);
		pst.setInt(2, age);
		pst.setString(3, team_name);

		pst.executeUpdate();
	}

	public void insertPlayer(FootballPlayer player) throws SQLException {
		String name = player.getPlayerName();
		int age = player.getAge();
		String team_name = player.getTeamName();
		
		PreparedStatement pst = this.conn.prepareStatement("insert into players values(?,?,?);");

		pst.setString(1, name);
		pst.setInt(2, age);
		pst.setString(3, team_name);

		pst.executeUpdate();
	}

	public void updatePlayer(String old_name, String name, int age, String team_name) throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("update players set name=?,age=?,team_name=? where name=?;");

		pst.setString(1, name);
		pst.setInt(2, age);
		pst.setString(3, team_name);
		pst.setString(4, old_name);

		pst.executeUpdate();
	}

	public void updatePlayer(String old_name,FootballPlayer player) throws SQLException {
		String name = player.getPlayerName();
		int age = player.getAge();
		String team_name = player.getTeamName();
		
		PreparedStatement pst = this.conn.prepareStatement("update players set name=?,age=?,team_name=? where name=?;");

		pst.setString(1, name);
		pst.setInt(2, age);
		pst.setString(3, team_name);
		pst.setString(4, old_name);

		pst.executeUpdate();
	}

	public ResultSet selectAllPlayers() throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("select * from players;");
		return pst.executeQuery();
	}

	public ArrayList<FootballPlayer> selectAllPlayers2() throws SQLException {
		ArrayList<FootballPlayer> players= new ArrayList<FootballPlayer>();
		PreparedStatement pst = this.conn.prepareStatement("select * from players;");
		ResultSet result = pst.executeQuery();
		while (result.next()){
			FootballPlayer player = new FootballPlayer(result.getString(1),result.getInt(2),result.getString(3));
			players.add(player);
		}
		return players;
	}
	
	public ResultSet selectPlayer(String old_name) throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("select * from players where name=?;");
		pst.setString(1, old_name);
		return pst.executeQuery();
	}

	public FootballPlayer selectPlayer2(String old_name) throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("select * from players where name=?;");
		pst.setString(1, old_name);
		ResultSet player = pst.executeQuery();
		return new FootballPlayer(player.getString(1),player.getInt(2),player.getString(3));
	}

	public void deletePlayer(String name) throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("delete from players where name=?;");
		pst.setString(1, name);
		pst.executeUpdate();
	}

	public void insertTeam(String name, String coach) throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("insert into teams values(?,?);");

		pst.setString(1, name);
		pst.setString(2, coach);

		pst.executeUpdate();
	}

	public void insertTeam(Team team) throws SQLException {
		String name = team.getTeamName();
		String coach = team.getCoach();
		
		PreparedStatement pst = this.conn.prepareStatement("insert into teams values(?,?);");

		pst.setString(1, name);
		pst.setString(2, coach);

		pst.executeUpdate();
	}

	public void updateTeam(String old_name, String name, String coach) throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("update teams set team_name=?,coach=? where team_name=?;");

		pst.setString(1, name);
		pst.setString(2, coach);
		pst.setString(3, old_name);

		pst.executeUpdate();
	}

	public void updateTeam(String old_name,Team team) throws SQLException {
		String name = team.getTeamName();
		String coach = team.getCoach();
		
		PreparedStatement pst = this.conn.prepareStatement("update teams set team_name=?,coach=? where team_name=?;");

		pst.setString(1, name);
		pst.setString(2, coach);
		pst.setString(3, old_name);

		pst.executeUpdate();
	}

	public ResultSet selectAllTeams() throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("select * from teams;");
		return pst.executeQuery();
	}

	public ArrayList<Team> selectAllTeams2() throws SQLException {
		ArrayList<Team> teams = new ArrayList<Team>();
		PreparedStatement pst = this.conn.prepareStatement("select * from teams;");
		ResultSet result = pst.executeQuery();
		while (result.next()) {
			Team team = new Team(result.getString(1),result.getString(2));
			teams.add(team);
		}
		return teams;
	}

	public ResultSet selectTeam(String old_name) throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("select * from teams where team_name=?;");
		pst.setString(1, old_name);
		return pst.executeQuery();
	}

	public Team selectTeam2(String old_name) throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("select * from teams where team_name=?;");
		pst.setString(1, old_name);
		ResultSet player = pst.executeQuery();
		return new Team(player.getString(1),player.getString(2));
	}

	public void deleteTeam(String name) throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("delete from teams where team_name=?;");
		pst.setString(1, name);
		pst.executeUpdate();
	}

	public int getMaxID() throws SQLException {
		PreparedStatement pst = conn.prepareStatement("select max(id) from matches;");
		ResultSet result = pst.executeQuery();
		return result.getInt(1);
	}

	public void insertMatch(String local_team, int local_goals, String visitor_team, int visitor_goals)
			throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("insert into matches values(?,?,?,?,?);");

		pst.setInt(1, this.getMaxID() + 1);
		pst.setString(2, local_team);
		pst.setInt(3, local_goals);
		pst.setString(4, visitor_team);
		pst.setInt(5, visitor_goals);

		pst.executeUpdate();
	}

	public void insertMatch(FootballMatch footballMatch)
			throws SQLException {
		String local_team = footballMatch.getLocalTeam().getTeamName();
		int local_goals = footballMatch.getGoalsLocal();
		String visitor_team = footballMatch.getVisitorTeam().getTeamName();
		int visitor_goals = footballMatch.getGoalsVisitor();
		
		PreparedStatement pst = this.conn.prepareStatement("insert into matches values(?,?,?,?,?);");

		pst.setInt(1, this.getMaxID() + 1);
		pst.setString(2, local_team);
		pst.setInt(3, local_goals);
		pst.setString(4, visitor_team);
		pst.setInt(5, visitor_goals);

		pst.executeUpdate();
	}

	public void updateMatch(int id,String local_team, int local_goals, String visitor_team, int visitor_goals)
			throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement(
				"update matches set local_team=?,local_goals=?,visitor_team=?,visitor_goals=? where id=?;");

		pst.setString(1, local_team);
		pst.setInt(2, local_goals);
		pst.setString(3, visitor_team);
		pst.setInt(4, visitor_goals);
		pst.setInt(5, id);

		pst.executeUpdate();
	}

	public void updateMatch(int id,FootballMatch footballMatch)
			throws SQLException {
		String local_team = footballMatch.getLocalTeam().getTeamName();
		int local_goals = footballMatch.getGoalsLocal();
		String visitor_team = footballMatch.getVisitorTeam().getTeamName();
		int visitor_goals = footballMatch.getGoalsVisitor();
		
		PreparedStatement pst = this.conn.prepareStatement(
				"update matches set local_team=?,local_goals=?,visitor_team=?,visitor_goals=? where id=?;");

		pst.setString(1, local_team);
		pst.setInt(2, local_goals);
		pst.setString(3, visitor_team);
		pst.setInt(4, visitor_goals);
		pst.setInt(5, id);

		pst.executeUpdate();
	}

	public ResultSet selectAllMatches() throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("select * from matches;");
		return pst.executeQuery();
	}

	public ArrayList<FootballMatch> selectAllMatches2() throws SQLException {
		ArrayList<FootballMatch> footballMatches = new ArrayList<FootballMatch>();
		PreparedStatement pst = this.conn.prepareStatement("select local_team,local_goals,visitor_team,visitor_goals from matches;");
		ResultSet result = pst.executeQuery();
		while (result.next()) {
			FootballMatch footballMatch = new FootballMatch(new Team(result.getString(1)),result.getInt(2),new Team(result.getString(3)),result.getInt(4));
			footballMatches.add(footballMatch);
		}
		return footballMatches;
	}

	public ResultSet selectMatch(int id) throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("select * from matches where id=?;");
		pst.setInt(1, id);
		return pst.executeQuery();
	}

	public FootballMatch selectMatch2(int id) throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("select * from matches where id=?;");
		pst.setInt(1, id);
		ResultSet footballMatch = pst.executeQuery();
		return new FootballMatch(new Team(footballMatch.getString(1)),footballMatch.getInt(2),new Team(footballMatch.getString(3)),footballMatch.getInt(4));
	}

	public void deleteMatch(int id) throws SQLException {
		PreparedStatement pst = this.conn.prepareStatement("delete from matches where id=?;");
		pst.setInt(1, id);
		pst.executeUpdate();
	}
}