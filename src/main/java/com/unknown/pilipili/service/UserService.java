package com.unknown.pilipili.service;

import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.repository.UserRepository;
import com.unknown.pilipili.util.Paging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/28 19:52
 */
@Service
public class UserService {
    public static final String HASH_ALGORITHM = "MD5";
    public static final int HASH_INTERATIONS = 1024;
    @Autowired
    private UserRepository userRepo;
    public User save(User u){
        return userRepo.save(u);
    }
    public void delete(Long id){
        userRepo.delete(id);
    }
    public User findUserByUsername(String username){
        return userRepo.findUserByUsername(username);
    }
    public User findUserByUsernameAndPassword(String username, String password){
        return userRepo.findUserByUsernameAndPassword(username,password);
    }
    public List<User> findAll(){
        return (List<User>) userRepo.findAll();
    }
    public Page<User> getEntityPage(Map<String, Object> filterParams, int pageNumber, int pageSize, String sortType){
        PageRequest pageRequest = Paging.buildPageRequest(pageNumber, pageSize, sortType);
        Specification<User> spec = Paging.buildSpecification(filterParams,User.class);
        return userRepo.findAll(spec,pageRequest);
    }

}
