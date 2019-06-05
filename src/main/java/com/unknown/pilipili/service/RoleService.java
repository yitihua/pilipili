package com.unknown.pilipili.service;

import com.unknown.pilipili.domain.Role;
import com.unknown.pilipili.repository.RoleRepository;
import org.springframework.stereotype.Service;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/3 23:04
 */
@Service
public class RoleService {
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
}
