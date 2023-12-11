package edu.ifsp.sample.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import edu.ifsp.sample.model.request.ExpenseRequest;
import edu.ifsp.sample.model.response.ExpenseResponse;

@Controller
public class ExpenseController {
	
	@Autowired
	private APIService apiService;

    @GetMapping("/inserirGastos")
    public String inserirGastos() {
        return "inserirGastos";
    }    
    
    @PostMapping("/enviarGasto")
    public String CadastrarGasto(@RequestBody ExpenseRequest expenseRequest, HttpSession session) {
    	String attribute = session.getAttribute("jwtToken").toString();
    	String checkToken = apiService.checkToken(attribute);
    	if(checkToken.equals("Token válido")) {
    		apiService.createNewExpense(expenseRequest);
    	} else {
    		return "login";
    	}
    		
    	
        return "inserirGastos";
    }  
    
    @GetMapping("/mostraGastos")
    public String mostraGastos() {
        return "mostraGastos";
    }
    
    @GetMapping("/gerenciarGastos")
    public String gerenciarGastos(Model model, HttpSession session) {
    	List<ExpenseResponse> expenses = apiService.getExpenses(session.getAttribute("userCode").toString(), session.getAttribute("jwtToken").toString());
    	model.addAttribute("expenses", expenses);
        return "gerenciarGastos";
    }

}
