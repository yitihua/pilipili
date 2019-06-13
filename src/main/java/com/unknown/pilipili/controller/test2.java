package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.UserService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/5 0:30
 */
@Controller
@RequestMapping("/test2")
public class test2 {
    @Autowired
    private UserService userService;
    @RequestMapping("")
    public String show(Model model, ServletRequest request){
        return "/test2";
    }
    @RequestMapping("upload")
    public String upload(@RequestParam("uploadfile") CommonsMultipartFile file,
                         HttpServletRequest request, HttpSession session){
        if (!file.isEmpty()) {
            String type = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
            String filename = System.currentTimeMillis() + type;
            String path = request.getSession().getServletContext().getRealPath("/upload/" + filename);
            File destFile = new File(path);
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), destFile);
                User user = (User)session.getAttribute("user");
                user.setAvatar("/upload/" + filename);
                userService.save(user);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "redirect:/test";
        } else {
            return "redirect:/error";
        }
    }
}
