package com.unknown.pilipili.repository;

import com.unknown.pilipili.config.orm.PlatformRepository;
import com.unknown.pilipili.domain.Comment;
import com.unknown.pilipili.domain.News;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/1 20:47
 */

public interface CommentRepository extends PlatformRepository<Comment,Long> {
    @Query("from Comment where original = ?1 and layer = ?2")
    List<Comment> findAllByOriginalAndLayer(News news, int layer);
    @Query("from Comment where original = ?1")
    List<Comment> findAllByRootComment(Comment rootComment);
    @Query("from Comment where original = ?1 and layer = ?2")
    int countAllByOriginalAndLayer(News news,int layer);
    @Query("from  Comment where Comment = ?1")
    int countAllByRootComment(Comment rootComment);

}
