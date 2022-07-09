package com.jason.game.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "games")
public class Game {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date gameDate;
    private String homeTeam;
    private String awayTeam;
    private String homePitcher;
    private String awayPitcher;
    private String ballpark;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "teams_games",
            joinColumns = @JoinColumn(name = "team_id"),
            // Which entity we are tying the joincolumn to is inverse join column
            inverseJoinColumns = @JoinColumn(name = "game_id")
    )
    private List<Team> teams;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    public Game() {}

    public Game(Date gameDate, String homeTeam, String awayTeam, String homePitcher, String awayPitcher, String ballpark, List<Team> teams) {
        this.gameDate = gameDate;
        this.homeTeam = homeTeam;
        this.awayTeam = awayTeam;
        this.homePitcher = homePitcher;
        this.awayPitcher = awayPitcher;
        this.ballpark = ballpark;
        this.teams = teams;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getGameDate() {
        return gameDate;
    }

    public void setGameDate(Date gameDate) {
        this.gameDate = gameDate;
    }

    public String getHomeTeam() {
        return homeTeam;
    }

    public void setHomeTeam(String homeTeam) {
        this.homeTeam = homeTeam;
    }

    public String getAwayTeam() {
        return awayTeam;
    }

    public void setAwayTeam(String awayTeam) {
        this.awayTeam = awayTeam;
    }

    public String getHomePitcher() {
        return homePitcher;
    }

    public void setHomePitcher(String homePitcher) {
        this.homePitcher = homePitcher;
    }

    public String getAwayPitcher() {
        return awayPitcher;
    }

    public void setAwayPitcher(String awayPitcher) {
        this.awayPitcher = awayPitcher;
    }

    public String getBallpark() {
        return ballpark;
    }

    public void setBallpark(String ballpark) {
        this.ballpark = ballpark;
    }

    public List<Team> getTeams() {
        return teams;
    }

    public void setTeams(List<Team> teams) {
        this.teams = teams;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }
}
