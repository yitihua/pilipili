package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.Dict;
import com.unknown.pilipili.service.DictService;
import com.unknown.pilipili.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
    @PostMapping("createDict")
    public String createDict(Model model, ServletRequest request){
        System.out.println("yes");
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        Dict dict = new Dict(type,name);
        switch (Integer.valueOf(request.getParameter("status"))){
            case 0:
                dict.setStatus(Constants.Status.DISABLE);
            case 1:
                dict.setStatus(Constants.Status.ENABLE);
        }
        dictService.create(dict);
        return "redirect:/dataDictionary";
    }
}
