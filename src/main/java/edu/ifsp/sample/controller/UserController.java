package edu.ifsp.sample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import edu.ifsp.sample.model.request.UserRequest;

@Controller
public class UserController {
	
	@Autowired
	private APIService authService;

	@GetMapping("/cadastro")
    public String cadastro() {
        return "cadastro";
    } 
	
	@PostMapping("/create-new-user")
    public String create(@RequestBody UserRequest userRequest) {
		authService.createNewUser(userRequest);
        return "login";
    } 
}
