package com.jason.game.controllers;

import com.jason.game.models.Player;
import com.jason.game.services.PlayerService;
import com.jason.game.services.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
@Controller
public class PlayerController {

    @Autowired
    private PlayerService playerService;

    @Autowired
    private TeamService teamService;

    @GetMapping("/players")
    public String players(Model model) {
        model.addAttribute("allPlayers", playerService.getAll());
        model.addAttribute("allTeams", teamService.getAll());

        return "players.jsp";
    }

    @GetMapping("/players/new")
    public String newPlayer(@ModelAttribute("newPlayer") Player newPlayer, Model model) {
        model.addAttribute("allTeams", teamService.getAll());

        return "newPlayer.jsp";
    }

     @PostMapping("/players/create")
    public String createPlayer(@Valid @ModelAttribute("newPlayer") Player newPlayer, BindingResult result) {

        if(result.hasErrors()) {
            return "newPlayer.jsp";
        }

        playerService.create(newPlayer);


        return "redirect:/players";
    }

    // rendering the update page
    @GetMapping("/players/{id}/edit")
    public String editPlayer(@PathVariable Long id, @ModelAttribute("editPlayer") Player editPlayer, Model model) {
        model.addAttribute("player", playerService.getById(id));
        model.addAttribute("team", teamService.getAll());

        return "editPlayer.jsp";
    }

    @PutMapping("/players/{id}/update")
    public String updatePlayer(@Valid @ModelAttribute("editPlayer")Player editPlayer, BindingResult result, Model model) {

        if(result.hasErrors()) {
            model.addAttribute(editPlayer);
            return "editPlayer.jsp";
        }
        playerService.update(editPlayer);
        return "redirect:/players";

    }

    @DeleteMapping("/players/{id}/destroy")
    public String destroyPlayer(@PathVariable Long id) {

        playerService.deleteById(id);

        return "redirect:/players";
    }

    //	Method updated to get all the trainers from DB and show it on profile page
    @GetMapping("/players/{id}")
    public String profile(@PathVariable Long id, Model model) {
        model.addAttribute("player", playerService.getById(id));

        return "playerInfo.jsp";
    }

    @ModelAttribute("playerPosition")
    public List<String> getPlayerPosition() {
        List<String> positionList = new ArrayList<String>();
        positionList.add("Infield");
        positionList.add("Outfield");
        positionList.add("Pitcher");
        return positionList;
    }
}
