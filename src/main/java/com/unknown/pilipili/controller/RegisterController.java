package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.Dict;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.AccountService;
import com.unknown.pilipili.service.DictService;
import com.unknown.pilipili.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/28 23:54
 */
@Controller
@RequestMapping(value = "/register")
public class RegisterController {
    @Autowired
    private AccountService accountService;
    @Autowired
    private UserService userService;
    @Autowired
    private DictService dictService;

    @PostMapping(value = "")
    public String register(Model model, ServletRequest request, HttpSession httpSession){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String genderName = request.getParameter("gender");
        String educationName = request.getParameter("education");
        Dict gender = dictService.findDictByTypeAndName("性别",genderName);
        Dict education = dictService.findDictByTypeAndName("学历",educationName);
        User u = userService.findUserByUsername(username);
        if(u==null){
            u = new User(username,password,gender,education);
            accountService.save(u);
            httpSession.setAttribute("user",u);
            return "redirect:/index";
        }
        else {
            model.addAttribute("registerFail","用户名已被占用");
            return "redirect:/index";
        }
    }
}
