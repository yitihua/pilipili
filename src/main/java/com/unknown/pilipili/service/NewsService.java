package com.unknown.pilipili.service;

import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.repository.NewsRepository;
import com.unknown.pilipili.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public News create(News news){
        return newsRepository.save(news);
    }
    public News findOne(Long pkId){
        return newsRepository.findOne(pkId);
    }
    public List<News> findAll(){
        return (List<News>) newsRepository.findAll();
    }

    public List<News> findNewsByAuthor(String username){
        User u = userRepository.findUserByUsername(username);
        return newsRepository.findAllByAuthor(u);
    }
}
