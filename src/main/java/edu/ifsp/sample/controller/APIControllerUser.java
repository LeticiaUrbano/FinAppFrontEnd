package edu.ifsp.sample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import edu.ifsp.sample.APIServiceUser;
import edu.ifsp.sample.UserData; // Importa a classe UserData correta

@Controller
public class APIControllerUser {

    @Autowired
    private APIServiceUser apiServiceUser;

    @GetMapping("/api/data")
    public String getData(Model model) {
        UserData userData = apiServiceUser.getUserData();

        // Adiciona os dados do usuário como atributo do modelo
        model.addAttribute("userData", userData);

        return "index"; // Retorna o nome da visão (index.jsp)
    }
}
