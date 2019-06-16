package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.Type;
import com.unknown.pilipili.service.TypeService;
import com.unknown.pilipili.util.HttpServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import java.util.Map;

/**
 * @author <b>zhangfei/b>
 * @version 1.0, 2019/6/1 20:27
 */
@Controller
@RequestMapping("/admin/catalogManager")
public class CatalogManagerController {
    private static final int PAGE_SIZE = 8;
    @Autowired
    private TypeService typeService;
    @RequestMapping("")
    public String show(@RequestParam(value = "sortType",defaultValue = "auto") String sortType,
                       @RequestParam(value = "page",defaultValue = "1") int pageNumber, Model model, ServletRequest request){
        Map<String,Object> searchParams = HttpServlet.getParametersStartingWith(request,"s_");
        Page<Type> typePage = typeService.getEntityPage(searchParams,pageNumber,PAGE_SIZE,sortType);
        model.addAttribute("typePage",typePage);
        model.addAttribute("PAGE_SIZE",PAGE_SIZE);
        model.addAttribute("sortType",sortType);
        return "/admin/catalogManager";
    }
    @PostMapping("create")
    public String createType(Model model, ServletRequest request){
        String name = request.getParameter("name");
        String engName = request.getParameter("engName");
        Type type = new Type(name,engName);
        typeService.save(type);
        return "redirect:/admin/catalogManager";
    }
    @PostMapping("update/{id}")
    public String updateType(@PathVariable("id") Long pkId, Model model, ServletRequest request){
        Type newType = typeService.findOne(pkId);
        newType.setName(request.getParameter("name"));
        newType.setEngName(request.getParameter("engName"));
        typeService.save(newType);
        return "redirect:/admin/catalogManager";
    }
    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") Long id, Model model){
        typeService.delete(id);
        return "redirect:/admin/catalogManager";
    }
}
