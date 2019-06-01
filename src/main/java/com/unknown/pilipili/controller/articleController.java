package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.Comment;
import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.service.CommentService;
import com.unknown.pilipili.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/1 20:27
 */
@Controller
@RequestMapping("/article")
public class articleController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private CommentService commentService;
    @GetMapping("view/{id}")
    public String viewArticle(@PathVariable("id") Long pkId, Model model){
        News news = newsService.findOne(pkId);
        if(news==null) {
            return "redirect:/index/";
        }
        model.addAttribute("news",news);
        List<Comment> comments = commentService.findAllByOriginal(news);
        model.addAttribute("commentList",comments);
        return "/article";
    }
}
