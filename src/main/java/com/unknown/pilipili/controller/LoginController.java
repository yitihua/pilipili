package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
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
    private UserService userService;

    @PostMapping(value = "")
    public String login(Model model, ServletRequest request,HttpSession httpSession){
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()){
            return "redirect:/index";
        }
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try{
            User u = userService.findUserByUsername(username);
            AuthenticationToken token = new UsernamePasswordToken(username,password);
            ((UsernamePasswordToken) token).setRememberMe(true);
            subject.login(token);
        }catch (Exception e){
            model.addAttribute("loginFail","登录失败");
            e.printStackTrace();
            return "/error";
        }
        User u = (User) subject.getPrincipal();
        httpSession.setAttribute("user",u);
        model.addAttribute("loginSuccess","登录成功");
        return "redirect:/index";
    }
}
