package com.unknown.pilipili.repository;

import com.unknown.pilipili.config.orm.PlatformRepository;
import com.unknown.pilipili.domain.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/28 19:53
 */
@Repository
public interface UserRepository extends PlatformRepository<User,Long> {
    @Query("from User where username = ?1 and password = ?2")
    User findUserByUsernameAndPassword(String username, String password);
    User findUserByUsername(String username);
}
