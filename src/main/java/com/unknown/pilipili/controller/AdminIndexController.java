package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import java.util.List;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/3 16:12
 */

@Controller
@RequestMapping("/admin/index")
public class AdminIndexController {
    @Autowired
    private NewsService newsService;
    @RequestMapping("")
    public String show(Model model, ServletRequest request){
        List<News> newsList = newsService.findAll();
        model.addAttribute("newsList",newsList);
        return "/admin/index";
    }
}
