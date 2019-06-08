package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.Dict;
import com.unknown.pilipili.service.DictService;
import com.unknown.pilipili.util.Constants;
import com.unknown.pilipili.util.HttpServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import java.util.Map;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/2 17:02
 */
@Controller
@RequestMapping("/admin/dict")
public class DictController {
    private static final int PAGE_SIZE = 15;
    @Autowired
    private DictService dictService;
    @RequestMapping("")
    public String showDict(@RequestParam(value = "sortType",defaultValue = "auto") String sortType,
                           @RequestParam(value = "page",defaultValue = "1") int pageNumber, Model model, ServletRequest request){
        Map<String,Object> searchParams = HttpServlet.getParametersStartingWith(request,"s_");
        Page<Dict> dictPage = dictService.getEntityPage(searchParams,pageNumber,PAGE_SIZE,sortType);
        model.addAttribute("dictPage",dictPage);
        model.addAttribute("PAGE_SIZE",PAGE_SIZE);
        model.addAttribute("sortType",sortType);
        return "/admin/dict";
    }
    @PostMapping("createDict")
    public String createDict(Model model, ServletRequest request){
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        String status = request.getParameter("status");
        Dict dict = new Dict(type,name);
        switch (status){
            case "0":
                dict.setStatus(Constants.Status.DISABLE);
            case "1":
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

        switch (request.getParameter("status")){
            case "0":
                newDict.setStatus(Constants.Status.DISABLE);
            case "1":
                newDict.setStatus(Constants.Status.ENABLE);
        }
        dictService.save(newDict);
        return "redirect:/admin/dict";
    }
}
