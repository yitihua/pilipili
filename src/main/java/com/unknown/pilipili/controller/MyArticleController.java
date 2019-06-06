package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.NewsService;
import com.unknown.pilipili.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/3 15:46
 */
@Controller
@RequestMapping("/myArticle")
public class MyArticleController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private TypeService typeService;
    @RequestMapping("")
    public String show(Model model, ServletRequest request, HttpSession session){
        User u = (User) session.getAttribute("user");
        List<News> newsList = newsService.findNewsByAuthorName(u.getUsername());
        model.addAttribute("newsList",newsList);
        return "/myArticle";
    }

}
