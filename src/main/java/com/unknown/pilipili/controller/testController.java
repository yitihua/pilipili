package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.CommentService;
import com.unknown.pilipili.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/2 0:01
 */
@Controller
@RequestMapping("/test")
public class testController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private CommentService commentService;
    @RequestMapping("")
    public String test(Model model, HttpSession httpSession, ServletRequest request){
        News news = new News();
        User u = (User)httpSession.getAttribute("user");
        news.setContent("aaaaaaaaaaaaaaaaaa");
        System.out.println("bbbbb");
        System.out.println("aaa:"+u.getId());
        news.setAuthor(u);
        news.setTitle("aaaaaaaaaaaa");
        newsService.create(news);
        return "redirect:/index/";
    }

}
