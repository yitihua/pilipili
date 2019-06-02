package com.unknown.pilipili.controller;

import com.unknown.pilipili.domain.Comment;
import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.CommentService;
import com.unknown.pilipili.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/1 20:27
 */
@Controller
@RequestMapping("/article")
public class articleController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private CommentService commentService;

    @GetMapping("view/{id}")
    public String viewArticle(@PathVariable("id") Long pkId, Model model){
        News news = newsService.findOne(pkId);
        if(news==null) {
            return "redirect:/index/";
        }
        model.addAttribute("news",news);
        List<Comment> comments = commentService.findAllByOriginal(news);
        model.addAttribute("commentList",comments);
        return "/article";
    }
    @PostMapping("view/{id}/createComment")
    public String createComment(@PathVariable("id") Long newsId, Model model, ServletRequest request, HttpSession httpSession){
        News news = newsService.findOne(newsId);
        if(news==null) {
            return "redirect:/index/";
        }
        Long rootCommentId = Long.valueOf(request.getParameter("rootCommentId"));
        Long fatherCommentId = Long.valueOf(request.getParameter("rootCommentId"));
        Comment rootComment = null;
        Comment fatherComment = null;
        Comment newComment = new Comment();
        if(rootCommentId == null && fatherCommentId ==null){//一级评论
            newComment.setLayer(1);
            newComment.setLevel(commentService.countAllByOriginalAndLayer1(news)+1);
        }
        else if(rootCommentId == null) {//二级评论
            newComment.setLayer(2);
            rootCommentId = fatherCommentId;
            rootComment = commentService.findOne(rootCommentId);
            fatherComment = commentService.findOne(fatherCommentId);
            newComment.setLevel(commentService.countAllByRootComment(rootComment)+1);
        }
        else {//多级评论
            newComment.setLayer(2);
            rootComment = commentService.findOne(rootCommentId);
            fatherComment = commentService.findOne(fatherCommentId);
            newComment.setLevel(commentService.countAllByRootComment(rootComment)+1);
        }

        User author = (User)httpSession.getAttribute("user");
        String content = request.getParameter("content");

        newComment.setContent(content);
        newComment.setFather(fatherComment);
        newComment.setOriginal(news);
        newComment.setRootComment(rootComment);
        newComment.setAuthor(author);
        newComment.setReplies(null);
        commentService.create(newComment);
        return "redirect:/article/view/{id}";
    }

}
