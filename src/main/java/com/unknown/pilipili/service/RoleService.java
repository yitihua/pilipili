package com.unknown.pilipili.service;

import com.unknown.pilipili.domain.Role;
import com.unknown.pilipili.repository.RoleRepository;
import com.unknown.pilipili.util.Paging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/3 23:04
 */
@Service
public class RoleService {
    @Autowired
    private RoleRepository roleRepo;
    public Role findRoleByName(String name){
        return roleRepo.findRoleByName(name);
    }
    public Role save(Role role){
        return roleRepo.save(role);
    }
    public void delete(Role role){
        roleRepo.delete(role);
    }
    public Page<Role> getEntityPage(Map<String, Object> filterParams, int pageNumber, int pageSize, String sortType){
        PageRequest pageRequest = Paging.buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Role> spec = Paging.buildSpecification(filterParams,Role.class);
        return roleRepo.findAll(spec,pageRequest);
    }
}
