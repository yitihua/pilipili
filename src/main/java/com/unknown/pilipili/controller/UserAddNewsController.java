package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.domain.Type;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.NewsService;
import com.unknown.pilipili.service.TypeService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
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
    public String create(@RequestParam("uploadfile") CommonsMultipartFile file,
                         Model model, ServletRequest request, HttpSession session){

        News news = new News();
        news.setTitle(request.getParameter("title"));
        news.setContent(request.getParameter("content"));
        news.setType(typeService.findTypeByName(request.getParameter("type")));
        news.setAuthor((User)session.getAttribute("user"));

        if (!file.isEmpty()) {
            String type = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
            String filename = System.currentTimeMillis() + type;
            String path = session.getServletContext().getRealPath("/upload/" + filename);
            File destFile = new File(path);
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), destFile);
                news.setImg(filename);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        newsService.save(news);
        return "redirect:/myArticle";
    }
}
