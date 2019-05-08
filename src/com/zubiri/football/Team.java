package com.zubiri.football;
public class Team {

	private String teamName;
	private String coach;
	
	public Team(String name,String coach) {
		this.setTeamName(name);
		this.setCoach(coach);
	}
	
	public Team(String name) {
		this.setTeamName(name);
	}

	public String getTeamName() {
		return this.teamName;
	}

	public String getCoach() {
		return this.coach;
	}

	public void setTeamName(String TeamName) {
		this.teamName = TeamName;
	}

	public void setCoach(String Coach) {
		this.coach = Coach;
	}

}