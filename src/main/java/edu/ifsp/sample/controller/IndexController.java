package edu.ifsp.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/")
    public String index() {
        return "index";
    }
  
//    @GetMapping("/teste")
//    public String index2() {
//        return "index";
//    }
    
    
    
    
    
}
