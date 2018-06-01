package org.shopping.web.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.shopping.entity.Order;
import org.shopping.entity.ShoppCar;
import org.shopping.service.ShoppCarService;
import org.shopping.service.UserService;
import org.shopping.util.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by dell on 2018-04-26.
 */
@Controller
@RequestMapping("/shoppCar")
public class ShoppCarController {

    @Autowired
    private ShoppCarService service;

    @ResponseBody
    @RequestMapping(value = "/findAll",method = RequestMethod.GET)
    public  List<ShoppCar> findAll(){
        List<ShoppCar> list  = service.findAll();
        return service.findAll();
    }

    @ResponseBody
    @RequestMapping(value = "/findShoppCarById",method = RequestMethod.GET)
    public ShoppCar findShoppCarById(int shoppCarId){
        return service.findById(shoppCarId);
    }

    @ResponseBody
    @RequestMapping(value = "/addShoppCar",method = RequestMethod.POST)
    public int addShoppCar(ShoppCar shoppCar){
        return service.add(shoppCar);
    }

    @ResponseBody
    @RequestMapping(value = "/updateShoppCar",method = RequestMethod.POST)
    public int updateShoppCar(ShoppCar shoppCar){
        return service.update(shoppCar);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteShoppCar",method = RequestMethod.GET)
    public int deleteShoppCar(int shoppCarId){
        return service.deleteById(shoppCarId);
    }

    // 更新购物车的商品数量
    @ResponseBody
    @RequestMapping(value = "/updateShoppCarNo",method = RequestMethod.POST)
    public int updateShoppCarNo(int shoppCarId,int homeWearNo){
        return service.updateShoppCarNo(shoppCarId,homeWearNo);
    }

    // 清空购物车
    @ResponseBody
    @RequestMapping(value = "/clearCar",method = RequestMethod.GET)
    public void clearCar(){
        service.clearCar();
    }

    // 商品加入购物车
    @ResponseBody
    @RequestMapping(value = "/addCar",method = RequestMethod.POST)
    public int addCar(HttpSession session,int homewearId, String price){
        // 前台传入家居编号和家居单价，后台计算数量和总价（初始的默认数量=1，总价=单价*1）
        int userId = UserUtils.getUserSession(session).getUserId();
        return service.addCar(homewearId,userId,price);

    }

    /**
     *
     * @return 订单信息
     */
    @RequestMapping(value = "/findPageAll",method = RequestMethod.GET)
    public String findPageAll(@RequestParam(required=true,defaultValue="1") Integer page, HttpServletRequest request, Model model){
        PageHelper.startPage(page,100);
        List<ShoppCar> orderList = service.findAll();
        PageInfo<ShoppCar> pageInfo = new PageInfo<>(orderList);
        model.addAttribute("page",pageInfo);
        model.addAttribute("orderList",orderList);
        return "shoppCar";
    }



}
