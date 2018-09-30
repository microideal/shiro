package com.microideal.shiro.sercive.impl;

import com.microideal.shiro.command.AuthorityCmd;
import com.microideal.shiro.constant.MessageType;
import com.microideal.shiro.dto.DataGridResponseEntity;
import com.microideal.shiro.dto.Msg;
import com.microideal.shiro.enums.MenuTypeEnum;
import com.microideal.shiro.mapper.AuthorityMapper;
import com.microideal.shiro.model.Authority;
import com.microideal.shiro.queryobject.AuthorityQueryObject;
import com.microideal.shiro.sercive.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author microideal on 2018/9/23
 */
@Service
public class AuthorityServiceImpl implements AuthorityService {
    private static final String VIEW_PAGE = "admin/authority/view";

    private static final String REDIRECT_LIST = "redirect:/backend/authority/list";

    @Autowired
    private AuthorityMapper authorityMapper;

    @Override
    public List<Authority> queryAll() {
        return authorityMapper.queryAll();
    }

    @Override
    public List<Authority> loadUserAuthority(Map<String, Object> map) {
        return authorityMapper.loadUserAuthority(map);
    }

    @Override
    public List<Authority> queryRoleAuthorityWithSelectedByRoleId(Long roleId) {
        return authorityMapper.queryRoleAuthorityWithSelectedByRoleId(roleId);
    }

    @Override
    public DataGridResponseEntity<Authority> queryListPage(AuthorityQueryObject queryObject) {
        List<Authority> roleList = authorityMapper.queryListPage(queryObject.getIDisplayStart(),queryObject.getIDisplayLength());
        int count = authorityMapper.queryListPageCount();
        return new DataGridResponseEntity<>(queryObject.getSEcho(),count,count,roleList);
    }

    @Override
    public Authority getById(Long id) {
        return authorityMapper.selectByPrimaryKey(id);
    }

    @Override
    public void saveOrUpdate(AuthorityCmd cmd, ModelAndView modelAndView) {
        if(cmd.getId() != null){//编辑
            if(cmd.getParentId() ==0 && cmd.getType().equals(MenuTypeEnum.LEVEL_1_MENU.getValue())){//填写的是一级菜单
                authorityMapper.updateByPrimaryKey(new Authority(cmd));
                modelAndView.setViewName(REDIRECT_LIST);
            }else {//不是一级菜单
                Authority authority = authorityMapper.selectByPrimaryKey(cmd.getParentId());//找到父级
                if(authority != null){
                    if(authority.getType().equals(cmd.getType() -1)){//菜单类型和父级菜单都是对应的
                        authorityMapper.updateByPrimaryKey(new Authority(cmd));
                        modelAndView.setViewName(REDIRECT_LIST);
                    }else {
                        modelAndView.addObject("parentIdError","权限类型和父级权限不对应！");
                        modelAndView.setViewName(VIEW_PAGE);
                    }
                }else {
                    modelAndView.addObject("parentIdError","父级权限id不存在!");
                    modelAndView.setViewName(VIEW_PAGE);
                }
            }
        }else {//新增
            if(cmd.getParentId() ==0 && cmd.getType().equals(MenuTypeEnum.LEVEL_1_MENU.getValue())){//填写的是一级菜单
                authorityMapper.insert(new Authority(cmd));
                modelAndView.setViewName(REDIRECT_LIST);
            }else {//不是一级菜单
                Authority authority = authorityMapper.selectByPrimaryKey(cmd.getParentId());//找到父级
                if(authority != null){
                    if(authority.getType().equals(cmd.getType() -1)){//菜单类型和父级菜单都是对应的
                        authorityMapper.insert(new Authority(cmd));
                        modelAndView.setViewName(REDIRECT_LIST);
                    }else {
                        modelAndView.addObject("parentIdError","权限类型和父级权限不对应！");
                        modelAndView.setViewName(VIEW_PAGE);
                    }
                }else {
                    modelAndView.addObject("parentIdError","父级权限id不存在!");
                    modelAndView.setViewName(VIEW_PAGE);
                }
            }
        }
    }

    @Override
    public Msg deleteById(Long id) {
        int count = authorityMapper.queryRoleAuthorityCount(id);
        if(count > 0){
            return new Msg<>(MessageType.MSG_TYPE_FAILURE,MessageType.AUTHORITY_IS_ALLOCATED_MSG,null);
        }else {
            authorityMapper.deleteByPrimaryKey(id);
            return new Msg<>(MessageType.MSG_TYPE_SUCCESS, null, null);
        }

    }

    @Override
    public List<Authority> queryLeftMenuByUserId(Long userId) {
        Map<String,Object> map = new HashMap<>();
        map.put("userId",userId);
        List<Authority> userAllAuthority = authorityMapper.loadUserAuthority(map);
        List<Authority> userLeftMenu = new ArrayList<>();
        userAllAuthority.forEach(authority -> {
            if(authority.getParentId() == 0){
                authority.setAuthorityList(authorityMapper.queryByParentId(authority.getId()));
                userLeftMenu.add(authority);
            }
        });
        return userLeftMenu;
    }
}
