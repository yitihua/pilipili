package com.unknown.pilipili.repository;

import com.unknown.pilipili.config.orm.PlatformRepository;
import com.unknown.pilipili.domain.Dict;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/2 16:01
 */
@Repository
public interface DictRepository extends PlatformRepository<Dict,Long> {
    @Query("from Dict d where d.type = ?1 and d.name = ?2")
    Dict findDictByTypeAndName(String type, String name);
}
