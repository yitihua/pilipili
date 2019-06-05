package com.unknown.pilipili.controller;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("userAuth")
public class ShiroLoginController {
    @RequestMapping("login")
    public String login(String username,String password){
        //获取当前的Subject
        System.out.println("aaaaaa");
        Subject currentUser = SecurityUtils.getSubject();
        //测试当前用户是否已经被认证(即是否已经登录)
        if (!currentUser.isAuthenticated()) {
            //将用户名与密码封装为UsernamePasswordToken对象
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            token.setRememberMe(true);//记录用户

                currentUser.login(token);//调用Subject的login方法执行登录

        }
        return "redirect:/list.jsp";
    }
}