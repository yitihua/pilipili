package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.UserService;
import com.unknown.pilipili.util.HttpServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import java.util.Map;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/6 15:03
 */
@Controller
@RequestMapping("/admin/access")
public class AuthcManageController {
    private static final int PAGE_SIZE = 15;
    @Autowired
    private UserService userService;
    @RequestMapping("")
    public String viewArticle(@RequestParam(value = "sortType",defaultValue = "auto") String sortType,
            @RequestParam(value = "page",defaultValue = "1") int pageNumber, Model model, ServletRequest request){
        Map<String,Object> searchParams = HttpServlet.getParametersStartingWith(request,"s_");
        Page<User> userPage = userService.getEntityPage(searchParams,pageNumber,PAGE_SIZE,sortType);
        model.addAttribute("userPage",userPage);
        model.addAttribute("PAGE_SIZE",PAGE_SIZE);
        model.addAttribute("sortType",sortType);
        return "/admin/access";
    }
}
