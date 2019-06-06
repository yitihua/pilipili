package com.unknown.pilipili.repository;

import com.unknown.pilipili.config.orm.PlatformRepository;
import com.unknown.pilipili.domain.Comment;
import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.domain.User;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/1 20:47
 */

public interface CommentRepository extends PlatformRepository<Comment,Long> {
    @Query("from Comment c where c.original = ?1 and c.layer = ?2")
    List<Comment> findAllByOriginalAndLayer(News news, int layer);
    @Query("from Comment c where c.rootComment = ?1")
    List<Comment> findAllByRootComment(Comment rootComment);
    @Query("from Comment c where c.author = ?1")
    List<Comment> findAllByAuthor(User user);
    @Query("select count(*) from Comment c where c.original = ?1 and c.layer = ?2")
    Long countByOriginalAndLayer(News news,int layer);
    @Query("select count(*) from Comment c where c.rootComment = ?1")
    Long countByRootComment(Comment rootComment);
}
