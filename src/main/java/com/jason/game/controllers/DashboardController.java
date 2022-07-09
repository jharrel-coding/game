package com.jason.game.controllers;

import com.jason.game.services.GameService;
import com.jason.game.services.PlayerService;
import com.jason.game.services.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@SuppressWarnings("SpringJavaAutowiredFieldsWarningInspection")
@Controller
public class DashboardController {

    @Autowired
    private GameService gameService;

    @Autowired
    private TeamService teamService;

    @Autowired
    private PlayerService playerService;

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("allGames", gameService.getAll());
        model.addAttribute("allTeams", teamService.getAll());
        model.addAttribute("allPlayers", playerService.getAll());

        return "dashboard.jsp";
    }
}
