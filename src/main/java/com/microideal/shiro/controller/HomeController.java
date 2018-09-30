package com.microideal.shiro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author microideal on 2018/9/28
 */
@Controller
public class HomeController {
    @RequestMapping("/")
    String home() {
        return "redirect:/backend/admin/index";
    }
}
