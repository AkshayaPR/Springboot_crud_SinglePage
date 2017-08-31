package com.kgfsl.springbootconfig.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;  
@Controller  
@RequestMapping(value = { "/helloworld" })
public class HelloWorldController {  
    @RequestMapping(value ="/hello", method = RequestMethod.GET)  
    public ModelAndView helloWorld() {  
        String message = "HELLO SPRING MVC HOW R U";  
        return new ModelAndView("hellopage", "message", message);  
    }  

    @RequestMapping(value ="/welcome", method = RequestMethod.GET)  
    public String welcome(Model model) {  
        String message = "HELLO SPRING MVC HOW R U from welcome request";  
        model.addAttribute("message",message);
        return "hellopage";  
    }
}  

