package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.domain.Type;
import com.unknown.pilipili.service.NewsService;
import com.unknown.pilipili.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import java.util.List;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/7 0:04
 */
@Controller
@RequestMapping("/admin/newsEdit")
public class AdminNewsEditController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private TypeService typeService;
    @RequestMapping("create")
    public String show(Model model){
        List<Type> typeList = typeService.findAll();
        model.addAttribute("typeList",typeList);
        return "/admin/newsEdit";
    }
    @GetMapping("{id}")
    public String showEdit(@PathVariable("id") Long id, Model model, ServletRequest request){
        List<Type> typeList = typeService.findAll();
        model.addAttribute("typeList",typeList);
        News news = newsService.findOne(id);
        model.addAttribute("news",news);
        return "/admin/newsEdit";
    }
    @PostMapping("edit/{id}")
    public String update(@PathVariable("id") Long id, Model model, ServletRequest request){
        News news = newsService.findOne(id);
        news.setTitle(request.getParameter("title"));
        news.setContent(request.getParameter("content"));
        news.setType(typeService.findTypeByName(request.getParameter("type")));
        //news.setImg(request.getParameter("img"));
        newsService.save(news);
        return "redirect:/admin/index";
    }

}
