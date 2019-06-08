package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.NewsService;
import com.unknown.pilipili.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/3 15:46
 */
@Controller
@RequestMapping("/myArticle")
public class MyArticleController {
    private static final int PAGE_SIZE = 15;
    @Autowired
    private NewsService newsService;
    @RequestMapping("")
    public String show(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, ServletRequest request, HttpSession session){
        User u = (User) session.getAttribute("user");
        PageRequest pageRequest = PageUtil.buildPageRequest(pageNumber, PAGE_SIZE, sortType);
        Page<News> newsPage = newsService.findAllByAuthor(u.getUsername(), pageRequest);
        model.addAttribute("newsPage", newsPage);
        model.addAttribute("sortType", sortType);
        model.addAttribute("PAGE_SIZE", PAGE_SIZE);
        return "/myArticle";
    }
    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") Long id, Model model){
        newsService.delete(id);
        return "redirect:/myArticle";
    }

}
