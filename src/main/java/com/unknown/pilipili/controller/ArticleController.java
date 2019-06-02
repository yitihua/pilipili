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
public class ArticleController {
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
        String rootCommentId = request.getParameter("rootCommentId");
        String fatherCommentId = request.getParameter("fatherCommentId");
        Comment rootComment = null;
        Comment fatherComment = null;
        Comment newComment = new Comment();
        if(rootCommentId == null && fatherCommentId == null){//一级评论
            newComment.setLayer(1);
            Long level = commentService.countByOriginalAndLayer1(news);
            if(level==null) newComment.setLevel(Long.valueOf(1));
            else newComment.setLevel(level+1);
        }
        else if(fatherCommentId == null && rootCommentId != null) {//二级评论
            newComment.setLayer(2);
            rootComment = commentService.findOne(Long.valueOf(rootCommentId));
            fatherComment = commentService.findOne(Long.valueOf(rootCommentId));
            Long level = commentService.countByRootComment(rootComment);
            if(level==null) newComment.setLevel(Long.valueOf(1));
            else newComment.setLevel(level+1);
        }
        else if(rootCommentId != null && fatherCommentId != null) {//多级评论
            newComment.setLayer(2);
            rootComment = commentService.findOne(Long.valueOf(rootCommentId));
            fatherComment = commentService.findOne(Long.valueOf(fatherCommentId));
            newComment.setLevel(commentService.countByRootComment(rootComment)+1);
        }
        else{
            System.out.println("error");
            return "redirect:/index/";
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
