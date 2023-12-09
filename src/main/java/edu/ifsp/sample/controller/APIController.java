package edu.ifsp.sample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class APIController {

	@Autowired //injeta o serviço da API
	private APIService apiService;
	
//	@GetMapping("/data")
//	public ResponseEntity<String> getData() {
//		String data = apiService.getData();
//		//return ResponseEntity.ok(data);
//		
//	}
	
	 @GetMapping("/data")
	    public String getData(Model model) {
	        String data = apiService.getData();
	        System.out.println("API Response: " + data);
	        // Adiciona a resposta como um atributo do modelo
	        model.addAttribute("apiResponse", data);

	        return "index"; // Retorna o nome da visão (index.jsp)
	    }	
	
	
	
}

