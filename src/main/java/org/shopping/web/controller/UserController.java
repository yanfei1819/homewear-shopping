package org.shopping.web.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.shopping.entity.Order;
import org.shopping.entity.ShoppCar;
import org.shopping.entity.User;
import org.shopping.service.UserService;
import org.shopping.util.UserUtils;
import org.shopping.web.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by dell on 2018-04-26.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/loginBegin",method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String home() {
        return "index";
    }



    /*************************菜单页面进行跳转************************/
    @RequestMapping(value = "/userList",method = RequestMethod.GET)
    public String userList() {
        return "userList";
    }

    @RequestMapping(value = "/shoppCar",method = RequestMethod.GET)
    public String shoppCar() {
        return "shoppCar";
    }

    @RequestMapping(value = "/order",method = RequestMethod.GET)
    public String order() {
        return "order";
    }

    @RequestMapping(value = "/homewear",method = RequestMethod.GET)
    public String homewear() {
        return "homewear";
    }

    @RequestMapping(value = "/error",method = RequestMethod.GET)
    public String error() {
        return "error";
    }

    @RequestMapping(value = "/roleList",method = RequestMethod.GET)
    public String role() {
        return "roleList";
    }



    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String register() {
        return "register";
    }


    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public String login(HttpSession session, String username, String password) {
        User user = userService.login(username,password);
        if(user!=null){
            UserUtils.saveUserSession(user, session);
            String sessionId = session.getId();
            System.out.println(sessionId);
            return "index";
        }else {
            return "error";
        }
    }

    // 退出
    @ResponseBody
    @RequestMapping(value = "/logout",method = RequestMethod.POST)
    public String logout(HttpSession session) {
        session.invalidate();
        return "success";
    }


    @ResponseBody
    @RequestMapping(value = "/findAll",method = RequestMethod.GET)
    public  List<User> findAll(){
        return userService.findAll();
    }

    // 查询数据总量
    @ResponseBody
    @RequestMapping(value = "/findCount",method = RequestMethod.GET)
    public int findCount(){
        return userService.findCount();
    }

//    @ResponseBody
//    @RequestMapping(value = "/findPageAll",method = RequestMethod.GET)
//    public  List<User> findPageAll(){
//        PageHelper.startPage(1,3,true);
//        List<User> orderList = userService.findAll();
//        PageInfo<User> pageInfo = new PageInfo<>(orderList);
//        return pageInfo.getList();
//    }

    @ResponseBody
    @RequestMapping(value = "/findAllByCondition",method = RequestMethod.GET)
    public  List<User> findAllByCondition(String mobile){
        if (mobile == null || mobile.trim().length() == 0){
            return userService.findAll();
        }
        return userService.findAllByCondition(mobile);
    }

    @ResponseBody
    @RequestMapping(value = "/findUserById",method = RequestMethod.GET)
    public User findUserById(int userId){
        return userService.findById(userId);
    }

    @ResponseBody
    @RequestMapping(value = "/addUser",method = RequestMethod.POST)
    public int addUser(UserDTO user){
        return userService.add(user.toUser());
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(UserDTO user){

        User userOld = userService.findByName(user.getName());
        if(userOld!=null){
            return "redirect:/user/error";
        }

        userService.add(user.toUser());
        return "redirect:/user/loginBegin";

    }

    @ResponseBody
    @RequestMapping(value = "/updateUser",method = RequestMethod.POST)
    public int updateUser(User user){
        return userService.update(user);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteUser",method = RequestMethod.GET)
    public int deleteUser(int userId){
        return userService.deleteById(userId);
    }

    // 获取登陆者的信息
    @ResponseBody
    @RequestMapping(value = "/getUserInfo",method = RequestMethod.GET)
    public User findUserById(HttpSession session){
        return UserUtils.getUserSession(session);
    }

    /**
     *
     * @return 订单信息
     */
    @RequestMapping(value = "/findPageAll",method = RequestMethod.GET)
    public String findPageAll(@RequestParam(required=true,defaultValue="1") Integer page, HttpServletRequest request, Model model){
        PageHelper.startPage(page,100);
        List<User> orderList = userService.findAll();
        PageInfo<User> pageInfo = new PageInfo<>(orderList);
        model.addAttribute("page",pageInfo);
        model.addAttribute("orderList",orderList);
        return "userList";
    }

}
