package com.unknown.pilipili.repository;

import com.unknown.pilipili.config.orm.PlatformRepository;
import com.unknown.pilipili.domain.News;
import com.unknown.pilipili.domain.Type;
import com.unknown.pilipili.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/30 23:00
 */
@Repository
public interface NewsRepository extends PlatformRepository<News,Long> {
    @Query ("from News where author = ?1")
    List<News> findAllByAuthor(User u);
    @Query("from News where type = ?1")
    List<News> findAllByType(Type type);
    @Query("select n from News n where n.author = ?1")
    Page<News> findAllByAuthor(User u, Pageable pageable);
    List<News> findByTitleLike(String title);
}
