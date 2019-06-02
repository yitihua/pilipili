package com.unknown.pilipili.domain;

import com.unknown.pilipili.config.orm.IdEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/25 21:38
 */
@Entity
@Table(name = "t_comment")
public class Comment extends IdEntity {
    @Column(nullable = false)
    private String content;

    @ManyToOne
    @JoinColumn(name="author",referencedColumnName="id")
    private User author;

    @ManyToOne
    @JoinColumn(name="fatherComment",referencedColumnName="id")
    private Comment father;

    @ManyToOne
    @JoinColumn(name="rootComment",referencedColumnName="id")
    private Comment rootComment;
    @ManyToOne
    @JoinColumn(name="Original",referencedColumnName="id")
    private News original;

    private Long level;

    private int layer;

    private LocalDateTime createAt = LocalDateTime.now();

    @Transient
    private List<Comment> replies;

    public Comment() {
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

    public Comment getFather() {
        return father;
    }

    public void setFather(Comment father) {
        this.father = father;
    }

    public News getOriginal() {
        return original;
    }

    public void setOriginal(News original) {
        this.original = original;
    }

    public Long getLevel() {
        return level;
    }

    public void setLevel(Long level) {
        this.level = level;
    }

    public int getLayer() {
        return layer;
    }

    public void setLayer(int layer) {
        this.layer = layer;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }


    public Comment getRootComment() {
        return rootComment;
    }

    public void setRootComment(Comment rootComment) {
        this.rootComment = rootComment;
    }

    @Transient
    public List<Comment> getReplies() {
        return replies;
    }

    public void setReplies(List<Comment> replies) {
        this.replies = replies;
    }
}
