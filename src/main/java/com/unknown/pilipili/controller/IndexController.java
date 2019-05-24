package com.unknown.pilipili.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/24 23:22
 */
@Controller
@RequestMapping("/index")
public class IndexController {
    @RequestMapping("")
    public String Index(Model model){
        return "/index";
    }

}
