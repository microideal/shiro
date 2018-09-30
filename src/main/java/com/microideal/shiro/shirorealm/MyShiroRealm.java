package com.microideal.shiro.shirorealm;

import com.microideal.shiro.model.Admin;
import com.microideal.shiro.model.Authority;
import com.microideal.shiro.sercive.AdminService;
import com.microideal.shiro.sercive.AuthorityService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author microideal on 2018/9/23
 */
public class MyShiroRealm extends AuthorizingRealm {

    @Autowired
    private AuthorityService authorityService;

    @Autowired
    private AdminService adminService;

    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        Admin user= (Admin) SecurityUtils.getSubject().getPrincipal();
        Map<String,Object> map = new HashMap<>();
        map.put("userId",user.getId());
        List<Authority> authorityList = authorityService.loadUserAuthority(map);
        // 权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        for(Authority authority: authorityList){
            info.addStringPermission(authority.getValue());
        }
        return info;
    }

    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //获取用户的输入的账号.
        String username = (String)token.getPrincipal();
        Admin admin = adminService.getByUsername(username);
        if(admin==null) throw new UnknownAccountException();
        if (0==admin.getStatus()) {
            throw new LockedAccountException(); // 帐号锁定
        }
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                admin, //用户
                admin.getPassword(), //密码
                ByteSource.Util.bytes(username),
                getName()  //realm name
        );
        // 当验证都通过后，把用户信息放在session里
        Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute("admin", admin);
        session.setAttribute("userSessionId", admin.getId());
        return authenticationInfo;
    }
}
