package com.jason.game.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "teams")
public class Team {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String teamName;
    private String teamInitials;
    private String ballpark;
    private String city;
    private String state;

    private boolean league;

    @OneToMany(mappedBy="team", fetch = FetchType.LAZY)
    private List<Player> players;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "teams_games",
            joinColumns = @JoinColumn(name = "game_id"),
            // Which entity we are tying the joincolumn to is inverse join column
            inverseJoinColumns = @JoinColumn(name = "team_id")
    )
    private List<Game> games;

//    @ManyToMany(fetch = FetchType.LAZY)
//    @JoinTable(
//            name = "teams_players",
//            joinColumns = @JoinColumn(name = "team_id"),
//            // Which entity we are tying the joincolumn to is inverse join column
//            inverseJoinColumns = @JoinColumn(name = "player_id")
//    )
//    private List<Team> teams;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    public Team() {}

    public Team(String teamName, String teamInitials, String ballpark, String city, String state, boolean league, List<Player> players, List<Game> games) {
        this.teamName = teamName;
        this.teamInitials = teamInitials;
        this.ballpark = ballpark;
        this.city = city;
        this.state = state;
        this.league = league;
        this.players = players;
        this.games = games;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getTeamInitials() {
        return teamInitials;
    }

    public void setTeamInitials(String teamInitials) {
        this.teamInitials = teamInitials;
    }

    public String getBallpark() {
        return ballpark;
    }

    public void setBallpark(String ballpark) {
        this.ballpark = ballpark;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public boolean isLeague() {
        return league;
    }

    public void setLeague(boolean league) {
        this.league = league;
    }

    public List<Player> getPlayers() {
        return players;
    }

    public void setPlayers(List<Player> players) {
        this.players = players;
    }

    public List<Game> getGames() {
        return games;
    }

    public void setGames(List<Game> games) {
        this.games = games;
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

    public String fullTeamName() {
//		return String.format("%s %s", this.firstName, this.lastName);
        return this.city + " " + this.teamName;
    }
}
