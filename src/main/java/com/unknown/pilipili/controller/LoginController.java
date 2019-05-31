package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/28 19:53
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private AccountService accountService;
    HttpSession session;

    @PostMapping(value = "")
    public String login(Model model, ServletRequest request,HttpSession httpSession){

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User u = accountService.login(username,password);
        if(u==null){
            model.addAttribute("loginFail","用户名或密码错误");
            return "redirect:/index";
        }
        else{
            httpSession.setAttribute("user",u);
            return "redirect:/index";
        }

    }
}
