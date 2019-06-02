package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.service.NewsService;
import com.unknown.pilipili.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/24 23:22
 */
@Controller
@RequestMapping("/index")
public class IndexController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private UserService userService;
    @RequestMapping("")
    public String Index(Model model){
        List<News> newsList = newsService.findAll();
        model.addAttribute("newsList",newsList);
        return "/index";
    }
}
