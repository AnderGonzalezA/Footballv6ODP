package com.zubiri.football;
public class FootballMatch {

	private Team localTeam;
	private Team visitorTeam;
	private int goalsLocal;
	private int goalsVisitor;
	
	public FootballMatch(Team local_team,int local_goals,Team visitor_team,int visitor_goals) {
		this.setLocalTeam(localTeam);
		this.setGoalsLocal(goalsLocal);
		this.setVisitorTeam(visitor_team);
		this.setGoalsVisitor(visitor_goals);
	}

	public Team getLocalTeam() {
		return this.localTeam;
	}

	public void setLocalTeam(Team LocalTeam) {
		this.localTeam=LocalTeam;
	}

	public Team getVisitorTeam() {
		return visitorTeam;
	}

	public void setVisitorTeam(Team visitorTeam) {
		this.visitorTeam=visitorTeam;
	}

	public int getGoalsLocal() {
		return goalsLocal;
	}

	public void setGoalsLocal(int goalsLocal) {
		this.goalsLocal=goalsLocal;
	}

	public int getGoalsVisitor() {
		return goalsVisitor;
	}

	public void setGoalsVisitor(int goalsVisitor) {
		this.goalsVisitor=goalsVisitor;
	}
}