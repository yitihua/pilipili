package com.unknown.pilipili.repository;

import com.unknown.pilipili.config.orm.PlatformRepository;
import com.unknown.pilipili.domain.Role;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/3 23:03
 */
@Repository
public interface RoleRepository extends PlatformRepository<Role,Long> {
    @Query("from Role r where r.name = ?1")
    Role findRoleByName(String name);
}
