package com.unknown.pilipili.service;

import com.unknown.pilipili.domain.Comment;
import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.repository.CommentRepository;
import com.unknown.pilipili.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/1 20:44
 */
@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    public Comment save(Comment comment){
        return commentRepository.save(comment);
    }
    public void delete(Long id){
        commentRepository.delete(id);
    }
    public Comment findOne(Long pkId){
        return commentRepository.findOne(pkId);
    }
    public List<Comment> findAllByOriginalAndLayer1(News news){
        List<Comment> comments = commentRepository.findAllByOriginalAndLayer(news,1);
        return comments;
    }
    public List<Comment> findAllByRootComment(Comment comment){
        List<Comment> replies = commentRepository.findAllByRootComment(comment);
        return replies;
    }
    public List<Comment> findAllByOriginal(News news){
        List<Comment> comments = findAllByOriginalAndLayer1(news);
        for(int i=0;i<comments.size();i++){
            comments.get(i).setReplies(findAllByRootComment(comments.get(i)));
        }
        return comments;
    }
    public List<Comment> findAllByAuthor(User user){
        return commentRepository.findAllByAuthor(user);
    }
    public Long countByOriginalAndLayer1(News news){
        return commentRepository.countByOriginalAndLayer(news,1);
    }
    public Long countByRootComment(Comment comment){
        return commentRepository.countByRootComment(comment);
    }
    public Page<Comment> getEntityPage(Map<String, Object> filterParams, int pageNumber, int pageSize, String sortType){
        PageRequest pageRequest = PageUtil.buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Comment> spec = PageUtil.buildSpecification(filterParams,Comment.class);
        return commentRepository.findAll(spec,pageRequest);
    }
    public Page<Comment> findAllByAuthor(User u, PageRequest pageable){
        Page<Comment> page = commentRepository.findAllByAuthor(u, pageable);
        return page;
    }
}
