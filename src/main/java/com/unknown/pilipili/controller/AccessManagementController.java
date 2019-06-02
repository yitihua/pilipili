package com.unknown.pilipili.controller;

import com.unknown.pilipili.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author <b>zhangfei/b>
 * @version 1.0, 2019/6/1 20:27
 */
@Controller
@RequestMapping("/accessManagement")//这个地方改成jsp文件的名字且不加后缀名
public class AccessManagementController {//类名和java文件名一样
    @Autowired
    private NewsService newsService;
    @RequestMapping("")
    public String viewArticle(Model model){
        return "/accessManagement";//这个地方也改成jsp文件的名字且不加后缀名
    }
}
