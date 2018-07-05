package com.smartcampus.controller;

import com.smartcampus.entity.Card;
import com.smartcampus.entity.Goods;
import com.smartcampus.entity.Orders;
import com.smartcampus.entity.User;
import com.smartcampus.service.CardService;
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
    @Autowired
    private CardService cardService;

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

    //获取商家登陆订单信息
    @RequestMapping(value="/businessOrder")
    public String businessOrder(HttpSession httpSession, Model model) {
        String uuid = (String) httpSession.getAttribute("UserUuid");
        List<Orders> orders = ordersService.getByUuid(uuid); //调用业务层方法
        model.addAttribute("Orders", orders);//把从数据库取到的数据放入到model中
        return "business/myOrders";
    }


    //产生订单
    @RequestMapping(value="/produce")
    public String produce(@RequestParam int id,@RequestParam String price,@RequestParam(value = "uuid",required = false)String uuid,HttpSession httpSession,Model model){
        System.out.println("test");
        System.out.println(id);
        System.out.println(price);
        System.out.println("test");
        Integer goodsId =Integer.valueOf(id);
        String userId = (String) httpSession.getAttribute("UserId");
        httpSession.getAttribute("GoodsId");
        uuid = (String)httpSession.getAttribute("UserUuid");
        Card card= cardService.getById(userId);
        double balance= Double.parseDouble(card.getCardBalance());
        double goodsPrice = Double.parseDouble(price);
        double newBalence = balance-goodsPrice;
        if ("1".equals(card.getState())&&newBalence>=0){
            ordersService.save(uuid,goodsId);
            cardService.update(userId,String.valueOf(newBalence));
            model.addAttribute("message","恭喜,您已下单完成，请等待配送！");
//            return "student/message";
        }
        else if ("1".equals(card.getState())&&newBalence<0){
            model.addAttribute("message","抱歉，账户余额不足，请充值后再进行购买");
//            return "student/message";
        }
        else if("0".equals(card.getState())){
            model.addAttribute("message","无法完成，请等待一卡通审核完成再进行该操作");
            System.out.println("等待审核");
//            return "student/message";
        }else{
            model.addAttribute("message","无法完成，请申请一卡通并等待审核完毕再进行该操作");
            System.out.println("申请");
        }
        return "student/message";

    }

//    //教师产生订单
//    @RequestMapping(value="/produceT")
//    public String produceT(@RequestParam int id,@RequestParam(value = "uuid",required = false)String uuid,HttpSession httpSession,Model model){
//        Integer goodsId =Integer.valueOf(id);
//        httpSession.getAttribute("GoodsId");
//        uuid = (String)httpSession.getAttribute("UserUuid");
//        ordersService.save(uuid,goodsId);
//        model.addAttribute("message","恭喜,您已下单完成，请等待配送！");
//        return "teacher/message";
//    }

    //学生删除订单
    @RequestMapping("delete")
    public String delete(@RequestParam int id,Model model){
        System.out.println(id);
        Integer cardId = Integer.valueOf(id);
        ordersService.delete(cardId);
        model.addAttribute("message","已删除");
        return "student/message";
    }
//    //老师删除订单
//    @RequestMapping("deleteT")
//    public String deleteT(@RequestParam int id,Model model){
//        Integer cardId = Integer.valueOf(id);
//        ordersService.delete(cardId);
//        model.addAttribute("message","已删除");
//        return "teacher/message";
//    }

}
