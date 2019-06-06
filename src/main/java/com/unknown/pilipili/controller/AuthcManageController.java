package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/6 15:03
 */
@Controller
@RequestMapping("/admin/access")
public class AuthcManageController {
    @Autowired
    private UserService userService;
    @RequestMapping("")
    public String viewArticle(Model model){
        List<User> userList = userService.findAll();
        model.addAttribute("userList",userList);
        return "/admin/access";
    }
}
