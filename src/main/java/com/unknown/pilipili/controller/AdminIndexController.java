package com.unknown.pilipili.controller;

import com.unknown.pilipili.service.NewsService;
import com.unknown.pilipili.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/3 16:12
 */

@Controller
@RequestMapping("/admin/index")
public class AdminIndexController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private UserService userService;
    @RequestMapping("")
    public String show(Model model, ServletRequest request){

        return "/admin/index";
    }
}
