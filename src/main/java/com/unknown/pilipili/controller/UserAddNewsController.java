package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.domain.Type;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.NewsService;
import com.unknown.pilipili.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/6 14:31
 */
@Controller
@RequestMapping("/add")
public class UserAddNewsController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private TypeService typeService;
    @RequestMapping("")
    public String show(Model model, ServletRequest request){
        List<Type> typeList = typeService.findAll();
        model.addAttribute("typeList",typeList);
        return "/add";
    }
    @PostMapping("create")
    public String create(Model model, ServletRequest request, HttpSession session){
        News news = new News();
        news.setTitle(request.getParameter("title"));
        news.setContent(request.getParameter("content"));
        news.setType(typeService.findTypeByName(request.getParameter("type")));
        //news.setImg(request.getParameter("img"));
        news.setAuthor((User)session.getAttribute("user"));
        newsService.save(news);
        return "redirect:/myArticle";
    }
}
