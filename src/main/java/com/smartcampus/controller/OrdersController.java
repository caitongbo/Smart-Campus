package com.smartcampus.controller;

import com.smartcampus.entity.Orders;
import com.smartcampus.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
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
        Orders orders = ordersService.getById(id); //调用业务层方法
        model.addAttribute("Orders",orders);//把从数据库取到的数据放入到model中
        return "student/myOrders";
    }

    //获取老师登陆订单信息
    @RequestMapping(value="/teacherOrder")
    public String teacherOrder(@RequestParam(value="id",required=false) String id, HttpSession httpSession, Model model) {
        id = (String) httpSession.getAttribute("UserId");
        Orders orders = ordersService.getById(id); //调用业务层方法
        model.addAttribute("Orders", orders);//把从数据库取到的数据放入到model中
        return "teacher/myOrders";
    }
}
