package com.unknown.pilipili.domain;

import com.unknown.pilipili.config.orm.IdEntity;

import java.time.LocalDateTime;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/25 21:38
 */

public class Comment extends IdEntity {
    private int sort;
    private String content;
    private User author;
    private LocalDateTime createAt = LocalDateTime.now();

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }
}
