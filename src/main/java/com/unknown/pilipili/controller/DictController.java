package com.unknown.pilipili.controller;

import com.unknown.pilipili.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/2 17:02
 */
@Controller
@RequestMapping("/dataDictionary")
public class DictController {
    @Autowired
    private DictService dictService;
    @RequestMapping("")
    public String meow(Model model, ServletRequest request){
        return "/dataDictionary";
    }
}
