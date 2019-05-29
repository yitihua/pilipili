package com.unknown.pilipili.service;

import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/28 19:52
 */
@Service
public class UserService {
    @Autowired
    private UserRepository userRepo;

    public User findUserByUsername(String username){
        return userRepo.findUserByUsername(username);
    }

}
