package edu.ifsp.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class InjectionController {

	@GetMapping("/injection")
	public String InjectionForm() {
		return "injection";
	}
	
	@PostMapping("/processForm")
	public String processForm(@RequestParam("message") String message, Model jsp) {
		
		//Simula a injeção de dados do Spring, qualquer coisa que seja digitado no form vai responder com essa string
		String messageFromSpring = message + " para você também!  =P";
		jsp.addAttribute("messageFromSpring", messageFromSpring);
		jsp.addAttribute("recicla", message);
		return "injection";
	
		
		//não colocar regra de negócio aqui e nem colocar os ifs. Fazer isso em outra classe, fazer os testes na pasta test.
	}
	
	
}
