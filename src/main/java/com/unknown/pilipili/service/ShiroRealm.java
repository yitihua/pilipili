package com.unknown.pilipili.service;

import com.unknown.pilipili.domain.Role;
import com.unknown.pilipili.domain.User;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;

public class ShiroRealm extends AuthorizingRealm {
    @Autowired
    private UserService userService;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        User user = userService.findUserByUsername(token.getUsername());

        if(user!=null){
            ByteSource credentialsSalt = ByteSource.Util.bytes(user.getUsername());
            AuthenticationInfo info = new SimpleAuthenticationInfo(new ShiroUser(user.getId(),user.getUsername()),
                    user.getPassword(),credentialsSalt,getName());
            return info;
        }else {
            throw new UnknownAccountException();
        }
    }
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
        User user = userService.findUserByUsername(shiroUser.getUsername());
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        if(user.getRoles()!=null){
            for(Role role: user.getRoles()){
                info.addRole(role.getName());
            }
        }
        return info;

    }

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