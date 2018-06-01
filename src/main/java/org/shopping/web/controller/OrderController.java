package org.shopping.web.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.shopping.entity.Order;
import org.shopping.service.OrderService;
import org.shopping.util.UserUtils;
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
 * Created by dell on 2018-04-27.
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService service;

    @ResponseBody
    @RequestMapping(value = "/findAll",method = RequestMethod.GET)
    public List<Order> findAll(){
        return service.findAll();
    }

    @ResponseBody
    @RequestMapping(value = "/findOrderById",method = RequestMethod.GET)
    public Order findOrderById(int orderId){
        return service.findById(orderId);
    }

    @ResponseBody
    @RequestMapping(value = "/addOrder",method = RequestMethod.POST)
    public int addOrder(Order order){
        return service.add(order);
    }

    @ResponseBody
    @RequestMapping(value = "/updateOrder",method = RequestMethod.POST)
    public int updateOrder(Order order){
        return service.update(order);
    }

    @ResponseBody
    @RequestMapping(value = "/updateOrderStatus",method = RequestMethod.POST)
    public int updateOrderStatus(Order order){
        return service.update(order);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteOrder",method = RequestMethod.GET)
    public int deleteOrder(int orderId){
        return service.deleteById(orderId);
    }

    // 生成订单
    @ResponseBody
    @RequestMapping(value = "/mkOrder",method = RequestMethod.POST)
    public int mkOrder(HttpSession session,int shoppingCarId){
        int userId = UserUtils.getUserSession(session).getUserId();
        return service.mkOrder(userId,shoppingCarId);
    }

    /**
     *
     * @return 订单信息
     */
    @RequestMapping(value = "/findPageAll",method = RequestMethod.GET)
    public String findPageAll(@RequestParam(required=true,defaultValue="1") Integer page, HttpServletRequest request, Model model){
        PageHelper.startPage(page,100);
        List<Order> orderList = service.findAll();
        PageInfo<Order> pageInfo = new PageInfo<>(orderList);
        model.addAttribute("page",pageInfo);
        model.addAttribute("orderList",orderList);
        return "order";
    }

}
