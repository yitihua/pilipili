package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.Type;
import com.unknown.pilipili.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import java.util.List;

/**
 * @author <b>zhangfei/b>
 * @version 1.0, 2019/6/1 20:27
 */
@Controller
@RequestMapping("/admin/catalogManager")
public class CatalogManagerController {
    @Autowired
    private TypeService typeService;
    @RequestMapping("")
    public String show(Model model){
        List<Type> typeList = typeService.findAll();
        model.addAttribute("typeList",typeList);
        return "/admin/catalogManager";
    }
    @PostMapping("createType")
    public String createType(Model model, ServletRequest request){
        String name = request.getParameter("name");
        String engName = request.getParameter("engName");
        Type type = new Type(name,engName);
        typeService.save(type);
        return "redirect:/admin/catalogManager";
    }
    @PostMapping("updateType/{id}")
    public String updateType(@PathVariable("id") Long pkId, Model model, ServletRequest request){
        Type newType = typeService.findOne(pkId);
        newType.setName(request.getParameter("name"));
        newType.setEngName(request.getParameter("engName"));
        typeService.save(newType);
        return "redirect:/admin/catalogManager";
    }
}
