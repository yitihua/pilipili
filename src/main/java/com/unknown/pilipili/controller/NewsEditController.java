package com.unknown.pilipili.controller;

import com.unknown.pilipili.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/1 20:27
 */
@Controller
@RequestMapping("/admin/newsEdit")
public class NewsEditController {
    @Autowired
    private NewsService newsService;
    @RequestMapping("")
    public String show(Model model){
        return "/admin/newsEdit";
    }
}
