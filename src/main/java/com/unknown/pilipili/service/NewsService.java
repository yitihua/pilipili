package com.unknown.pilipili.service;

import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.domain.Type;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.repository.NewsRepository;
import com.unknown.pilipili.repository.UserRepository;
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
 * @version 1.0, 2019/5/30 23:09
 */

@Service
public class NewsService {
    @Autowired
    private NewsRepository newsRepository;
    @Autowired
    private UserRepository userRepository;

    public News save(News news){
        return newsRepository.save(news);
    }
    public void delete(Long id){
        newsRepository.delete(id);
    }
    public News findOne(Long pkId){
        return newsRepository.findOne(pkId);
    }
    public List<News> findAll(){
        return (List<News>) newsRepository.findAll();
    }
    public List<News> findNewsByType(Type type){
        return newsRepository.findAllByType(type);
    }
    public List<News> findNewsByAuthorName(String username){
        User u = userRepository.findUserByUsername(username);
        return newsRepository.findAllByAuthor(u);
    }

    public Page<News> getEntityPage(Map<String, Object> filterParams, int pageNumber, int pageSize, String sortType){
        PageRequest pageRequest = PageUtil.buildPageRequest(pageNumber, pageSize, sortType);
        Specification<News> spec = PageUtil.buildSpecification(filterParams,News.class);
        return newsRepository.findAll(spec,pageRequest);
    }

    public Page<News> findAllByAuthor(String username, PageRequest pageable){
        User u = userRepository.findUserByUsername(username);
        Page<News> page = newsRepository.findAllByAuthor(u, pageable);
        return page;
    }


}
