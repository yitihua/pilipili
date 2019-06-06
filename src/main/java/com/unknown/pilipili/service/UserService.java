package com.unknown.pilipili.service;

import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public User findUserByUsername(String username){
        return userRepo.findUserByUsername(username);
    }
    public User findUserByUsernameAndPassword(String username, String password){
        return userRepo.findUserByUsernameAndPassword(username,password);
    }
    public List<User> findAll(){
        return (List<User>) userRepo.findAll();
    }


}
