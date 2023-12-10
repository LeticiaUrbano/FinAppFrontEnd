package edu.ifsp.sample.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ifsp.sample.model.response.UserResponse;

@Controller
public class InjectionController {
	
	@Autowired
	private APIService authService;
	
    @GetMapping("/injection")
    public String injectionForm() {
        return "injection";
    }

    @PostMapping("/processForm")
    public String processForm(
    		@RequestParam("message") String message, 
    		Model jsp) {
        // Simula a injeção de dados do Spring
        String messageFromSpring = message + " para você também ! =P";
        jsp.addAttribute("teste", messageFromSpring);
        jsp.addAttribute("recicla", message);
        return "injection";
    }
    @GetMapping("/data")
    public String getData(Model model) {
        try {
            List<UserResponse.UserItem> users = authService.getUsers();
            
            // Adiciona a lista de usuários como um atributo do modelo
            model.addAttribute("users", users);

            for (UserResponse.UserItem user : users) {
                System.out.println("Nome: " + user.getNomeCompleto());
                System.out.println("Email: " + user.getEmail());
                System.out.println("ID Externo: " + user.getIdExterno());
                // Adicione outras propriedades conforme necessário
                System.out.println("------------------------");
            }
            
            return "index"; // Retorna o nome da visão (index.jsp)
        } catch (Exception e) {
            // Tratar exceções, se necessário
            e.printStackTrace();
            return "error"; // Retorna uma visão de erro
        }
    }
}














