package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.NewsService;
import com.unknown.pilipili.service.TypeService;
import com.unknown.pilipili.util.HttpServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

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
    @Autowired
    private TypeService typeService;
    @RequestMapping("")
    public String list(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, ServletRequest request, HttpSession session){
        User u = (User) session.getAttribute("user");
        Map<String, Object> searchParams = HttpServlet.getParametersStartingWith(request, "s_");
        Page<News> newsPage = newsService.getEntityPage(searchParams, pageNumber, PAGE_SIZE, sortType);
        model.addAttribute("newsPage", newsPage);
        model.addAttribute("sortType", sortType);
        model.addAttribute("PAGE_SIZE", PAGE_SIZE);
        model.addAttribute("searchParams", HttpServlet.encodeParameterStringWithPrefix(searchParams, "s_"));
        return "/myArticle";
    }
    @RequestMapping("edit/{id}")
    public String edit(){
        return "redirect:/myArticle";
    }

}
