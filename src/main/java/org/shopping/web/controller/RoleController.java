package org.shopping.web.controller;

import org.shopping.entity.PageBean;
import org.shopping.entity.Role;
import org.shopping.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by shiyanfei on 2018-05-04.
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("/roleList")
    public String roleList(PageBean<List<Role>> roleList,Model model){

        List<Role> roles = roleService.findRoles();
        model.addAttribute("roleList",roles);

        model.addAttribute("","");

        return "roleList";
    }

}
