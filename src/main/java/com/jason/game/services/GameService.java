package com.jason.game.services;

import com.jason.game.models.Game;
import com.jason.game.repositories.GameRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
@Service
public class GameService {

    @Autowired
    private GameRepository gameRepository;

    public List<Game> getAll() {
        return gameRepository.findAll();
    }

    public Game create(Game newGame) {
        return gameRepository.save(newGame);
    }

    public Game getById(Long id) {

        return gameRepository.findById(id).orElse(null);
    }

    public Game update(Game editGame) {
        return gameRepository.save(editGame);
    }

    public void deleteById(Long id) {
        gameRepository.deleteById(id);
    }
}
