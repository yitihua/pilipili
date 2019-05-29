package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/28 19:53
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private AccountService accountService;

    @PostMapping(value = "")
    public String login(Model model, ServletRequest request){

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User u = accountService.login(username,password);
        if(u==null){
            model.addAttribute("message","用户名或密码错误");
            return "/index";
        }
        else{
            model.addAttribute("user",u);
            return "/index";
        }

    }
}
