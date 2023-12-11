package edu.ifsp.sample.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import edu.ifsp.sample.model.request.UserRequest;

@Controller
public class LoginController {
	
	@Autowired
	private APIService apiService;
	
	@GetMapping("/login")
    public String login(){
        return "login";
    }
	
	@PostMapping("/logins")
	public String pegartoken(@RequestBody UserRequest userRequest, HttpSession session){
	    String token = apiService.getToken(userRequest);
	    if (token == null) {
	        return "login";
	    } else {

	    	String userCode = apiService.getUserCode(userRequest.getEmail(), token);
	    	session.setAttribute("userCode", userCode);
	        session.setAttribute("jwtToken", token);
	        session.setAttribute("userEmail", userRequest.getEmail());
	        return "redirect:/telaInicial";
	    }
	}

}
