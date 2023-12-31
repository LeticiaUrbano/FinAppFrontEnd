package edu.ifsp.sample.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ifsp.sample.model.request.ExpensePutRequest;
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
    	String token = session.getAttribute("jwtToken").toString();
    	String userEmail = session.getAttribute("userEmail").toString();
    	String checkToken = apiService.checkToken(token);
    	if(checkToken.equals("Token válido")) {
    		apiService.vincularGastoComUser(expenseRequest, token, userEmail);
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
    
    @DeleteMapping("/deleteGasto")
    public void deleteGasto(@RequestParam String expenseCode, Model model, HttpSession session) {
        String token = session.getAttribute("jwtToken").toString();
        apiService.checkToken(token);
        apiService.deleteGasto(expenseCode, token);
    }
    @PutMapping("/atualizarGasto")
    public void atualizarGasto(@RequestBody ExpensePutRequest expensePutRequest, HttpSession session) {
        String token = session.getAttribute("jwtToken").toString();
        apiService.checkToken(token);
        apiService.atualizarGasto(expensePutRequest, token);
    }
    
    
    @GetMapping("/gerenciarGastos2")
    public String gerenciarGastos2(Model model) {
    	List<ExpenseResponse> expenses = new ArrayList<>();
    	
    	ExpenseResponse exp1 = new ExpenseResponse();
    	exp1.setCode("codigo de teste 1");
    	exp1.setExpenseName("Despesa 1 teste");
    	exp1.setExpensePrice("77");
    	expenses.add(exp1);
    	
    	ExpenseResponse exp2 = new ExpenseResponse();
    	exp2.setCode("codigo de teste 2");
    	exp2.setExpenseName("Despesa 2 teste");
    	exp2.setExpensePrice("6924");
    	expenses.add(exp2);
    	
    	ExpenseResponse exp3 = new ExpenseResponse();
    	exp3.setCode("codigo de teste 3 ashdksajhdjksahdjk");
    	exp3.setExpenseName("Despesa 3 teste aslhdkjsaghdkjsajkdjksa");
    	exp3.setExpensePrice("6924465465465");
    	expenses.add(exp3);
    	
    	model.addAttribute("expenses", expenses);
        return "gerenciarGastos";
    }
}
