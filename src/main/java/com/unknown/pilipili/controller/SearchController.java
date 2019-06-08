package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import java.util.List;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/8 17:55
 */

@Controller
@RequestMapping("/search")
public class SearchController {
    @Autowired
    private NewsService newsService;
    @PostMapping("")
    public String show(Model model, ServletRequest request){
        String search = request.getParameter("search");
        List<News> newsList = newsService.findByTitleLike(search);
        model.addAttribute("newsList",newsList);
        return "/search";
    }
}
