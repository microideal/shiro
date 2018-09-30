package com.microideal.shiro.sercive;

import com.microideal.shiro.command.RoleAddAuthoritiesCmd;
import com.microideal.shiro.command.RoleCmd;
import com.microideal.shiro.command.UserAddRolesCmd;
import com.microideal.shiro.dto.DataGridResponseEntity;
import com.microideal.shiro.dto.Msg;
import com.microideal.shiro.model.Role;
import com.microideal.shiro.queryobject.RoleQueryObject;
import java.util.List;

/**
 * @author microideal on 2018/9/25
 */
public interface RoleService {
    DataGridResponseEntity<Role> queryListPage(RoleQueryObject queryObject);

    Msg addRoleAuthority(RoleAddAuthoritiesCmd cmd);

    Msg addUserRole(UserAddRolesCmd cmd);

    Role getById(Long id);

    int saveOrUpdate(RoleCmd cmd);

    Msg deleteById(Long id);

    List<Role> queryUserRoleWithSelectedByUserId(Long userId);
}
