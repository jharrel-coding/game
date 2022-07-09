package com.jason.game.services;

import com.jason.game.models.Team;
import com.jason.game.repositories.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
@Service
public class TeamService {

    @Autowired
    private TeamRepository teamRepository;

    public List<Team> getAll() {
        return teamRepository.findAll();
    }

    public Team create(Team newTeam) {
        return teamRepository.save(newTeam);
    }

    public Team getById(Long id) {

        return teamRepository.findById(id).orElse(null);
    }

    public Team update(Team editTeam) {
        return teamRepository.save(editTeam);
    }

    public void deleteById(Long id) {
        teamRepository.deleteById(id);
    }
}
