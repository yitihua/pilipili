package com.unknown.pilipili.service;


import com.unknown.pilipili.domain.Role;
import com.unknown.pilipili.domain.User;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.Serializable;


/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/6/3 18:44
 */
@Component
public class ShiroDbRealm extends AuthorizingRealm {
    @Autowired
    protected AccountService accountService;
    @Autowired
    protected UserService userService;
    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        User user = userService.findUserByUsername(token.getUsername());

        if(user!=null){
            //byte[] salt = Encodes.decodeHex(user.getSalt());
            Object principal = user.getUsername();
            Object credentials = user.getPassword();
            AuthenticationInfo info = new SimpleAuthenticationInfo(principal,
                    credentials,getName());
            return info;
        }else {
            throw new UnknownAccountException();
        }
    }
    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection princials){
        ShiroUser shiroUser = (ShiroUser) princials.getPrimaryPrincipal();
        User user = userService.findUserByUsername(shiroUser.getUsername());
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        if(user.getRoles()!=null){
            for(Role role: user.getRoles()){
                info.addRole(role.getName());
            }
        }
        return info;
    }
    @PostConstruct
    public void initCredentialsMatcher(){
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(AccountService.HASH_ALGORITHM);
        matcher.setHashIterations(AccountService.HASH_INTERATIONS);
        setCredentialsMatcher(matcher);
    }

    @Autowired
    public void setAccountService(AccountService accountService){this.accountService = accountService;}

    public static class ShiroUser implements Serializable {
        private static final long serivalVersionUID = -1373760761780840081L;
        public Long id;
        public String username;

        public ShiroUser(Long id, String username) {
            this.id = id;
            this.username = username;
        }


        public Long getId() {
            return id;
        }

        public void setId(Long id) {
            this.id = id;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }
    }

}

