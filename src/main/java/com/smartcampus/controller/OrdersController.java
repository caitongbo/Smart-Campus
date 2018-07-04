package com.smartcampus.controller;

import com.smartcampus.entity.Goods;
import com.smartcampus.entity.Orders;
import com.smartcampus.entity.User;
import com.smartcampus.service.GoodsService;
import com.smartcampus.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 订单管理的Controller层
 *
 */
@Controller
@RequestMapping("/orders")
public class OrdersController {

    @Autowired
    private OrdersService ordersService;

    //获取学生登陆订单信息
    @RequestMapping(value="/studentOrder")
    public String studentOrder(@RequestParam(value="id",required=false) String id, HttpSession httpSession, Model model){
        id = (String) httpSession.getAttribute("UserId");
        List<Orders> orders = ordersService.getById(id); //调用业务层方法
        model.addAttribute("Orders",orders);//把从数据库取到的数据放入到model中
        return "student/myOrders";
    }

    //获取老师登陆订单信息
    @RequestMapping(value="/teacherOrder")
    public String teacherOrder(@RequestParam(value="id",required=false) String id, HttpSession httpSession, Model model) {
        id = (String) httpSession.getAttribute("UserId");
        List<Orders> orders = ordersService.getById(id); //调用业务层方法
        model.addAttribute("Orders", orders);//把从数据库取到的数据放入到model中
        return "teacher/myOrders";
    }


    //产生订单
    @RequestMapping(value="/produce")
    public String delete(@RequestParam int id,@RequestParam(value = "uuid",required = false)String uuid,HttpSession httpSession,Model model){
        Integer goodsId =Integer.valueOf(id);
        httpSession.getAttribute("GoodsId");
        System.out.printf("111111111"+ (String) httpSession.getAttribute("GoodsId"));
        uuid = (String)httpSession.getAttribute("UserUuid");
        ordersService.save(uuid,goodsId);
        model.addAttribute("message","恭喜,您已下单完成，请等待配送！");
        return "student/message";
    }
}
