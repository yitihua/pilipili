package com.unknown.pilipili.shiro;

import com.unknown.pilipili.domain.Role;
import com.unknown.pilipili.domain.User;
import com.unknown.pilipili.service.UserService;
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

public class ShiroRealm extends AuthorizingRealm {
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
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        User user = (User) principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        if(user.getRoles()!=null){
            for(Role role: user.getRoles()){
                info.addRole(role.getName());
            }
        }
        return info;

    }

}