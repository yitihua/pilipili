package com.unknown.pilipili.controller;

import com.unknown.pilipili.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;

@Controller
@RequestMapping("/add")
public class addController {
    @Autowired
    private UserService userService;
    @RequestMapping("")
    public String show(Model model, ServletRequest request){
        return "/add";
    }
}
