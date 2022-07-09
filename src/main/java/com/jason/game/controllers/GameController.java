package com.jason.game.controllers;

import com.jason.game.models.Game;
import com.jason.game.models.Player;
import com.jason.game.services.GameService;
import com.jason.game.services.PlayerService;
import com.jason.game.services.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
@Controller
public class GameController {

    @Autowired
    private GameService gameService;

    @Autowired
    private TeamService teamService;

    @Autowired
    private PlayerService playerService;

    @GetMapping("/games")
    public String games(Model model) {
        model.addAttribute("allGames", gameService.getAll());
        model.addAttribute("allTeams", teamService.getAll());
        model.addAttribute("allPlayers", playerService.getAll());

        return "games.jsp";
    }

    @GetMapping("/games/new")
    public String newGame(@ModelAttribute("newGame")Game newGame, Model model) {
        model.addAttribute("allTeams", teamService.getAll());
        model.addAttribute("allPlayers", playerService.getAll());

        return "newGame.jsp";
    }

    @PostMapping("/games/create")
    public String createGame(@Valid @ModelAttribute("newGame") Game newGame, BindingResult result) {

        if(result.hasErrors()) {
            return "newGame.jsp";
        }

        gameService.create(newGame);


        return "redirect:/games";
    }

    // rendering the update page
    @GetMapping("/games/{id}/edit")
    public String editGame(@PathVariable Long id, @ModelAttribute("editGame") Game editGame, Model model) {
        model.addAttribute("game", gameService.getById(id));

        return "editGame.jsp";
    }

    @PutMapping("/games/{id}/update")
    public String updateGame(@Valid @ModelAttribute("editGame")Game editGame, BindingResult result, Model model) {

        if(result.hasErrors()) {
            model.addAttribute(editGame);
            return "editGame.jsp";
        }
        gameService.update(editGame);
        return "redirect:/games";

    }

    @DeleteMapping("/games/{id}/destroy")
    public String destroyGame(@PathVariable Long id) {

        gameService.deleteById(id);

        return "redirect:/games";
    }

    //	Method updated to get all the trainers from DB and show it on profile page
    @GetMapping("/games/{id}")
    public String profile(@PathVariable Long id, Model model) {
        model.addAttribute("game", gameService.getById(id));

        return "gameInfo.jsp";

    }
}
