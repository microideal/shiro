package com.microideal.shiro.controller;

import com.microideal.shiro.command.AuthorityCmd;
import com.microideal.shiro.constant.MessageType;
import com.microideal.shiro.dto.DataGridResponseEntity;
import com.microideal.shiro.dto.Msg;
import com.microideal.shiro.model.Authority;
import com.microideal.shiro.queryobject.AuthorityQueryObject;
import com.microideal.shiro.sercive.AuthorityService;
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
@RequestMapping("/backend/authority")
public class AuthorityController {

    private static final String VIEW_PAGE = "admin/authority/view";

    private static final String REDIRECT_LIST = "redirect:/backend/authority/list";

    @Autowired
    private AuthorityService authorityService;

    @GetMapping("/queryRoleAuthorityWithSelectedByRoleId")
    @ResponseBody
    public ResponseEntity<Msg<List<Authority>>> queryRoleAuthorityWithSelectedByRoleId(Long roleId){
        Msg<List<Authority>> msg = new Msg<>(MessageType.MSG_TYPE_SUCCESS,null,authorityService.queryRoleAuthorityWithSelectedByRoleId(roleId));
        return new ResponseEntity<>(msg, HttpStatus.OK);
    }

    @RequestMapping(value = "/list")
    public String index() {
        return "admin/authority/list";
    }

    @GetMapping("/queryListPage")
    @ResponseBody
    public DataGridResponseEntity<Authority> queryListPage(AuthorityQueryObject queryObject){
        return authorityService.queryListPage(queryObject);
    }

    @GetMapping(value = "/view")
    public ModelAndView view (Long id) {
        ModelAndView result = new ModelAndView(VIEW_PAGE);
        if(null != id){
            Authority entity = authorityService.getById(id);
            result.addObject("entity", entity);
        }
        return result;
    }

    @PostMapping("/saveOrUpdate")
    public ModelAndView saveOrUpdate(AuthorityCmd cmd){
        ModelAndView modelAndView = new ModelAndView();
        authorityService.saveOrUpdate(cmd,modelAndView);
        return modelAndView;
    }

    @DeleteMapping("/{id}")
    @ResponseBody
    public ResponseEntity<Msg> delete(@PathVariable Long id){
        return new ResponseEntity<>(authorityService.deleteById(id), HttpStatus.OK);
    }
}
