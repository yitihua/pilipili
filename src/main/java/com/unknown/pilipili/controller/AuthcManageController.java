package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.Role;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.RoleService;
import com.unknown.pilipili.service.UserService;
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
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/6 15:03
 */
@Controller
@RequestMapping("/admin/access")
public class AuthcManageController {
    private static final int PAGE_SIZE = 8;
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
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
    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") Long id, Model model){
        userService.delete(id);
        return "redirect:/admin/access";
    }
    @PostMapping("update/{id}")
    public String update(@PathVariable("id") Long id, Model model, ServletRequest request){
        String []rolesTmp = request.getParameterValues("roles");
        Set<Role> roles = new HashSet<Role>();
        for(String role:rolesTmp){
            roles.add(roleService.findRoleByName(role));
        }
        User user = userService.findUserById(id);
        user.setRoles(roles);
        userService.save(user);
        return "redirect:/admin/access";
    }
}
