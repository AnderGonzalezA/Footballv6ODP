package com.zubiri.football;
public class FootballPlayer extends Player {

	private String teamName = "";
	
	public FootballPlayer(String name,int age,String team) {
		this.setPlayerName(name);
		this.setAge(age);
		this.setTeamName(team);
	}

	public String getPlayerName() {
		return this.playerName;
	}

	public void setPlayerName(String PlayerName) {
		this.playerName = PlayerName;
	}

	public String getTeamName() {
		return this.teamName;
	}

	public void setTeamName(String TeamName) {
		this.teamName = TeamName;
	}

	public int getAge() {
		return this.age;
	}

	public void setAge(int Age) {
		this.age = Age;
	}

}