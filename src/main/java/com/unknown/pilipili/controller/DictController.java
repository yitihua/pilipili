package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.Dict;
import com.unknown.pilipili.service.DictService;
import com.unknown.pilipili.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import java.util.List;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/2 17:02
 */
@Controller
@RequestMapping("/admin/dict")
public class DictController {
    @Autowired
    private DictService dictService;
    @RequestMapping("")
    public String showDict(Model model, ServletRequest request){
        List<Dict> dictList = dictService.findAll();
        model.addAttribute("dictList",dictList);
        return "/admin/dict";
    }
    @PostMapping("createDict")
    public String createDict(Model model, ServletRequest request){
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        Dict dict = new Dict(type,name);
        switch (Integer.valueOf(request.getParameter("status"))){
            case 0:
                dict.setStatus(Constants.Status.DISABLE);
            case 1:
                dict.setStatus(Constants.Status.ENABLE);
        }
        dictService.save(dict);
        return "redirect:/admin/dict";
    }
    @PostMapping("updateDict/{id}")
    public String updateDict(@PathVariable("id") Long pkId, Model model, ServletRequest request){
        Dict newDict = dictService.findOne(pkId);
        newDict.setType(request.getParameter("type"));
        newDict.setName(request.getParameter("name"));

        switch (Integer.valueOf(request.getParameter("status"))){
            case 0:
                newDict.setStatus(Constants.Status.DISABLE);
            case 1:
                newDict.setStatus(Constants.Status.ENABLE);
        }
        dictService.save(newDict);
        return "redirect:/admin/dict";
    }
}
