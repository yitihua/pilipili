package com.unknown.pilipili.service;

import com.unknown.pilipili.domain.User;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
public class ShiroRealm extends AuthenticatingRealm{
    @Autowired
    private UserService userService;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        User user = userService.findUserByUsername(token.getUsername());

        if(user!=null){
            ByteSource credentialsSalt = ByteSource.Util.bytes(user.getUsername());
            AuthenticationInfo info = new SimpleAuthenticationInfo(user,
                    user.getPassword(),credentialsSalt,getName());
            return info;
        }else {
            throw new UnknownAccountException();
        }
    }
}