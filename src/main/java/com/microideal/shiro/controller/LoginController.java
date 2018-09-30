package com.microideal.shiro.controller;

import com.microideal.shiro.model.Admin;
import com.microideal.shiro.model.Authority;
import com.microideal.shiro.sercive.AdminService;
import com.microideal.shiro.sercive.AuthorityService;
import com.microideal.shiro.utils.MD5;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2016/9/20.
 */
@Controller
@RequestMapping("/backend/admin")
public class LoginController {

    private static final String LOGIN_PAGE = "admin/login";

    private static final String INDEX_PAGE = "admin/index";

    @Autowired
    private AuthorityService authorityService;

    @Autowired
    private AdminService adminService;



    @RequestMapping(value = "/login")
    public String login() {

        return LOGIN_PAGE;
    }

    @RequestMapping(value = "/index")
    public ModelAndView index(HttpServletRequest request) {
        Long userId = (Long) request.getSession().getAttribute("userSessionId");
        List<Authority> userLeftMenu =  authorityService.queryLeftMenuByUserId(userId);
        ModelAndView modelAndView = new ModelAndView("admin/index");
        modelAndView.addObject("userLeftMenu",userLeftMenu);
        request.getSession().setAttribute("userLeftMenu",userLeftMenu);//freemarker能从session获取到？
        return modelAndView;
    }

    @RequestMapping(value = "/loginAction",method = RequestMethod.POST)
    public ModelAndView loginAction(String username, String password, HttpSession session) {
        Admin entity = adminService.getByUsername(username);
        ModelAndView result = new ModelAndView(LOGIN_PAGE);
        if(null == entity){

            result.addObject("error","用户不存在");
        }else if(!entity.getPassword().equals(password)){
            result.addObject("error","密码不正确");
        }else{
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken token=new UsernamePasswordToken(entity.getUsername(),entity.getPassword());

            try {
                subject.login(token);
            }catch (LockedAccountException lae) {
                token.clear();
                result.addObject("error","用户已经被锁定不能登录，请与管理员联系！");
            } catch (AuthenticationException e) {
                token.clear();
            }

            //session.setAttribute(Constant.CURRENT_USER_SESSION_NAME,entity);
            result.setViewName("redirect:/backend/admin/index");
        }

        return result;
    }



}
