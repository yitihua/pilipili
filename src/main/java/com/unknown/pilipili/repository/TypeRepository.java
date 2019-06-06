package com.unknown.pilipili.repository;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/6 14:36
 */

import com.unknown.pilipili.config.orm.PlatformRepository;
import com.unknown.pilipili.domain.Type;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface TypeRepository extends PlatformRepository<Type,Long> {
    @Query("from Type t where t.name = ?1")
    Type findTypeByName(String name);
}
