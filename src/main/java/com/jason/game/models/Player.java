package com.jason.game.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "players")
public class Player {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int jerseyNumber;
    private String firstName;
    private String lastName;
    private boolean hittingHand;
    private boolean throwingHand;
    private String playerPosition;
    private String teamName;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="team_id")
    private Team team;

    public Player() {}

    public Player(int jerseyNumber, String firstName, String lastName, boolean hittingHand, boolean throwingHand, String playerPosition, String teamName, Team team) {
        this.jerseyNumber = jerseyNumber;
        this.firstName = firstName;
        this.lastName = lastName;
        this.hittingHand = hittingHand;
        this.throwingHand = throwingHand;
        this.playerPosition = playerPosition;
        this.teamName = teamName;
        this.team = team;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getJerseyNumber() {
        return jerseyNumber;
    }

    public void setJerseyNumber(int jerseyNumber) {
        this.jerseyNumber = jerseyNumber;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public boolean isHittingHand() {
        return hittingHand;
    }

    public void setHittingHand(boolean hittingHand) {
        this.hittingHand = hittingHand;
    }

    public boolean isThrowingHand() {
        return throwingHand;
    }

    public void setThrowingHand(boolean throwingHand) {
        this.throwingHand = throwingHand;
    }

    public String getPlayerPosition() {
        return playerPosition;
    }

    public void setPlayerPosition(String playerPosition) {
        this.playerPosition = playerPosition;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
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

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

    public String fullName() {
//		return String.format("%s %s", this.firstName, this.lastName);
        return this.firstName + " " + this.lastName;
    }
}
