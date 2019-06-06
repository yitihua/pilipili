package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.Comment;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/6 21:28
 */
@Controller
@RequestMapping("/myComment")
public class MyCommentController {
    @Autowired
    private CommentService commentService;
    @RequestMapping("")
    public String show(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        List<Comment> commentList = commentService.findAllByAuthor(user);
        model.addAttribute("commentList",commentList);
        return "/myComment";
    }
}
