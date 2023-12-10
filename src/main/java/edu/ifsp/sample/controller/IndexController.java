package edu.ifsp.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/")
    public String index() {
        return "index";
    }
    
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/cadastro")
    public String cadastro() {
        return "cadastro";
    } 
    
    @GetMapping("/telaInicial")
    public String telaInicial() {
        return "telaInicial";
    }     
    
    @GetMapping("/inserirGastos")
    public String inserirGastos() {
        return "inserirGastos";
    }     
    
    @GetMapping("/mostraGastos")
    public String mostraGastos() {
        return "mostraGastos";
    }
    
    
}
