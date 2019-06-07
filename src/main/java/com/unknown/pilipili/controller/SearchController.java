package com.unknown.pilipili.controller;

import com.unknown.pilipili.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/search")
public class SearchController {
    @Autowired
    private NewsService newsService;
    @RequestMapping("")
    public String viewArticle(Model model){
        return "/search";//这个地方也改成jsp文件的名字且不加后缀名
    }
}
