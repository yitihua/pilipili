package com.unknown.pilipili.shiro;

import com.unknown.pilipili.service.CommentService;
import com.unknown.pilipili.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.LinkedHashMap;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/6 12:24
 */

public class FilterChainDefinitionMapBuilder {
    @Autowired
    private NewsService newsService;
    @Autowired
    private CommentService commentService;
    public LinkedHashMap<String,String> buildFilterChainDefinitionMap(){
        LinkedHashMap<String,String> map = new LinkedHashMap<String,String>();
        //关闭过滤
        //map.put("/**","anon");

        //游客可见
        map.put("/static/**","anon");
        map.put("/index","anon");
        map.put("/register","anon");
        map.put("/login","anon");
        map.put("/error","anon");
        map.put("/article/view/**","anon");

        //指定角色访问
        map.put("/admin/**","roles[admin]");

        //登出
        map.put("/logout","logout");

        //登录可见
        map.put("/**","user");

        return map;
    }
}
