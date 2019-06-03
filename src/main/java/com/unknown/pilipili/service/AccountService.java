package com.unknown.pilipili.service;

import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/28 23:38
 */

@Service
public class AccountService {
    public static final String HASH_ALGORITHM = "SHA-1";
    public static final int HASH_INTERATIONS = 1024;
    @Autowired
    private UserRepository userRepo;

    public User login(String username, String password){
        return userRepo.findUserByUsernameAndPassword(username,password);
    }

    public User save(User u){
        return userRepo.save(u);
    }

}
