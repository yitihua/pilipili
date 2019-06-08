package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.Comment;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.CommentService;
import com.unknown.pilipili.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/6 21:28
 */
@Controller
@RequestMapping("/myComment")
public class MyCommentController {
    private static final int PAGE_SIZE = 15;
    @Autowired
    private CommentService commentService;
    @RequestMapping("")
    public String show(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, ServletRequest request, HttpSession session){
        User user = (User) session.getAttribute("user");
        PageRequest pageable = PageUtil.buildPageRequest(pageNumber,PAGE_SIZE,sortType);
        Page<Comment> commentPage = commentService.findAllByAuthor(user,pageable);
        model.addAttribute("commentPage",commentPage);
        model.addAttribute("sortType", sortType);
        model.addAttribute("PAGE_SIZE", PAGE_SIZE);
        return "/myComment";
    }
}
