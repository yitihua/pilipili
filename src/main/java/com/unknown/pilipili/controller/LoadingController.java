package com.unknown.pilipili.controller;

import com.unknown.pilipili.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/loading")
public class LoadingController {
    @Autowired
    private NewsService newsService;
    @RequestMapping("")
    public String viewArticle(Model model){
        return "/loading";
    }
}
