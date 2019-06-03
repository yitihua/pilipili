package com.unknown.pilipili.controller;

import com.unknown.pilipili.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author <b>zhangfei/b>
 * @version 1.0, 2019/6/1 20:27
 */
@Controller
@RequestMapping("/catalogManager")//这个地方改成jsp文件的名字且不加后缀名
public class CatalogManagerController {//类名和java文件名一样
    @Autowired
    private AccountService accountService;
    @RequestMapping("")
    public String viewArticle(Model model){
        return "/catalogManager";//这个地方也改成jsp文件的名字且不加后缀名
    }
}
