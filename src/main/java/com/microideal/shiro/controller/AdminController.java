package com.microideal.shiro.controller;

import com.microideal.shiro.dto.DataGridResponseEntity;
import com.microideal.shiro.model.Admin;
import com.microideal.shiro.queryobject.AdminForm;
import com.microideal.shiro.sercive.AdminService;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

/**
 * Created by Administrator on 2016/9/20.
 */
@Controller
@RequestMapping("/backend/admin")
public class AdminController {

    private static final String VIEW_PAGE = "admin/admin/view";

    private static final String LIST_PAGE = "admin/admin/list";

    private static final String REDIRECT_LIST = "redirect:/backend/admin/list";

    @Autowired
    private AdminService adminService;


    @RequestMapping(value = "/list")
    @RequiresAuthentication
    public String index() {

        return LIST_PAGE;
    }

    //显示供应商列表
    @ResponseBody
    @RequestMapping(value = "/list/ajax", method = RequestMethod.GET)
//    @RequiresAuthentication
    public DataGridResponseEntity<Admin> listAjax(AdminForm form) {
        List<Admin> supplierList = adminService.selectListPage(form.getEntity(), form.getiDisplayStart(), form.getiDisplayLength());
        int count = adminService.selectListPageCount(form.getEntity());
        DataGridResponseEntity<Admin> entity = new DataGridResponseEntity<>();
        entity.setData(supplierList);
        entity.setsEcho(form.getsEcho());
        entity.setRecordsFiltered(count);
        entity.setRecordsTotal(count);
        return entity;
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public ModelAndView view (Long id) {
        ModelAndView result = new ModelAndView(VIEW_PAGE);

        if(null != id && id > 0){

            Admin entity = adminService.getById(id);
            result.addObject("entity", entity);
        }

        return result;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView save(AdminForm form){

        ModelAndView result = new ModelAndView(REDIRECT_LIST);

        adminService.saveOrupdate(form.getEntity());
        return result;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") Long id){

        ModelAndView result = new ModelAndView(REDIRECT_LIST);

        if(id!=null){

            adminService.delete(id);
        }
        return result;
    }
}
