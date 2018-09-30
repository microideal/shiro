package com.microideal.shiro.controller;

import com.microideal.shiro.command.RoleAddAuthoritiesCmd;
import com.microideal.shiro.command.RoleCmd;
import com.microideal.shiro.command.UserAddRolesCmd;
import com.microideal.shiro.constant.MessageType;
import com.microideal.shiro.dto.DataGridResponseEntity;
import com.microideal.shiro.dto.Msg;
import com.microideal.shiro.model.Role;
import com.microideal.shiro.queryobject.RoleQueryObject;
import com.microideal.shiro.sercive.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

/**
 * @author microideal on 2018/9/25
 */
@Controller
@RequestMapping("/backend/role")
public class RoleController {
    private static final String VIEW_PAGE = "admin/role/view";

    private static final String REDIRECT_LIST = "redirect:/backend/role/list";

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/list")
    public String index() {
        return "admin/role/list";
    }

    @GetMapping("/queryListPage")
    @ResponseBody
    public DataGridResponseEntity<Role> queryListPage(RoleQueryObject queryObject){
        return roleService.queryListPage(queryObject);
    }

    @PostMapping("/addRoleAuthority")
    @ResponseBody
    public ResponseEntity<Msg> addRoleAuthority(@RequestBody RoleAddAuthoritiesCmd cmd){
        return new ResponseEntity<>(roleService.addRoleAuthority(cmd), HttpStatus.OK);
    }

    @GetMapping(value = "/view")
    public ModelAndView view (Long id) {
        ModelAndView result = new ModelAndView(VIEW_PAGE);
        if(null != id){
            Role entity = roleService.getById(id);
            result.addObject("entity", entity);
        }
        return result;
    }

    @PostMapping("/saveOrUpdate")
    public ModelAndView saveOrUpdate(RoleCmd cmd){
        roleService.saveOrUpdate(cmd);
        ModelAndView result = new ModelAndView(REDIRECT_LIST);
        return result;
    }

    @DeleteMapping("/{id}")
    @ResponseBody
    public ResponseEntity<Msg> delete(@PathVariable Long id){
        return new ResponseEntity<>(roleService.deleteById(id), HttpStatus.OK);
    }

    @GetMapping("/queryUserRoleWithSelected")
    @ResponseBody
    public ResponseEntity<Msg<List<Role>>> queryUserRoleWithSelected(Long userId){
        Msg<List<Role>> msg = new Msg<>(MessageType.MSG_TYPE_SUCCESS,null,roleService.queryUserRoleWithSelectedByUserId(userId));
        return new ResponseEntity<>(msg, HttpStatus.OK);
    }

    @PostMapping("/addUserRole")
    @ResponseBody
    public ResponseEntity<Msg> addUserRole(@RequestBody UserAddRolesCmd cmd){
        return new ResponseEntity<>(roleService.addUserRole(cmd), HttpStatus.OK);
    }
}
