package com.microideal.shiro.sercive.impl;

import com.microideal.shiro.command.RoleAddAuthoritiesCmd;
import com.microideal.shiro.command.RoleCmd;
import com.microideal.shiro.command.UserAddRolesCmd;
import com.microideal.shiro.constant.MessageType;
import com.microideal.shiro.dto.DataGridResponseEntity;
import com.microideal.shiro.dto.Msg;
import com.microideal.shiro.mapper.RoleAuthoritiesMapper;
import com.microideal.shiro.mapper.RoleMapper;
import com.microideal.shiro.mapper.UserRolesMapper;
import com.microideal.shiro.model.Role;
import com.microideal.shiro.model.RoleAuthorities;
import com.microideal.shiro.model.UserRoles;
import com.microideal.shiro.queryobject.RoleQueryObject;
import com.microideal.shiro.sercive.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author microideal on 2018/9/25
 */
@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private RoleAuthoritiesMapper roleAuthoritiesMapper;

    @Autowired
    private UserRolesMapper userRolesMapper;

    @Override
    public DataGridResponseEntity<Role> queryListPage(RoleQueryObject queryObject) {
        List<Role> roleList = roleMapper.queryListPage(queryObject.getIDisplayStart(),queryObject.getIDisplayLength());
        int count = roleMapper.queryListPageCount();
        return new DataGridResponseEntity<>(queryObject.getSEcho(),count,count,roleList);
    }

    @Override
    public Msg addRoleAuthority(RoleAddAuthoritiesCmd cmd) {
        //删除
        Example example = new Example(RoleAuthorities.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("roleId",cmd.getRoleId());
        roleAuthoritiesMapper.deleteByExample(example);
        //再加
        cmd.getAuthorityIds().forEach(authorityId -> roleAuthoritiesMapper.insert(new RoleAuthorities(cmd.getRoleId(),authorityId)));
        return new Msg<>(MessageType.MSG_TYPE_SUCCESS, null, null);
    }

    @Override
    public Msg addUserRole(UserAddRolesCmd cmd) {
        //删除
        Example example = new Example(UserRoles.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userId",cmd.getUserId());
        userRolesMapper.deleteByExample(example);
        //再加
        cmd.getRoleIds().forEach(roleId -> userRolesMapper.insert(new UserRoles(cmd.getUserId(),roleId)));
        return new Msg<>(MessageType.MSG_TYPE_SUCCESS, null, null);
    }

    @Override
    public Role getById(Long id) {
        return roleMapper.getById(id);
    }

    @Override
    public int saveOrUpdate(RoleCmd cmd) {
        if(cmd.getId() != null){
            return roleMapper.update(new Role(cmd.getId(),cmd.getName(),cmd.getValue()));
        }else {
            return roleMapper.insert(new Role(cmd.getId(),cmd.getName(),cmd.getValue()));
        }

    }

    @Override
    public Msg deleteById(Long id) {
        int count = roleMapper.queryUserRoleCount(id);
        if(count > 0){
            return new Msg<>(MessageType.MSG_TYPE_FAILURE,MessageType.Role_IS_ALLOCATED_MSG,null);
        }else {
            roleMapper.deleteByPrimaryKey(id);
            Example example = new Example(RoleAuthorities.class);
            Example.Criteria criteria = example.createCriteria();
            criteria.andEqualTo("roleId",id);
            roleAuthoritiesMapper.deleteByExample(example);
            return new Msg<>(MessageType.MSG_TYPE_SUCCESS, null, null);
        }

    }

    @Override
    public List<Role> queryUserRoleWithSelectedByUserId(Long userId) {
        return roleMapper.queryUserRoleWithSelectedByUserId(userId);
    }
}
