package com.smartcampus.controller;

import com.smartcampus.dao.UserMapper;
import com.smartcampus.entity.Goods;
import com.smartcampus.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品管理的Controller层
 *
 */
@Controller
@RequestMapping(value = "/goods")
public class GoodsController {

    /**
     * 注入service层
     * 使用@Resource和@Autowired都可以实现Bean的自动注入
     */
    @Autowired
    private GoodsService goodsService;

    //所有商品信息
    @RequestMapping(value="/goodsInfo")
    public String list(@RequestParam(value = "id",required = false)String id, HttpSession httpSession, Model model){
        id = (String) httpSession.getAttribute("UserId");
        List<Goods> goodses = goodsService.getAllById(id); //调用业务层方法
        model.addAttribute("goodses",goodses);//把从数据库取到的数据放入到model中
    return "business/goodsInfo";
    }

    //已上架
    @RequestMapping(value="/goodsHasUp")
    public String goodsHasUp(@RequestParam(value = "id",required = false)String id, HttpSession httpSession, Model model){
        id = (String) httpSession.getAttribute("UserId");
        List<Goods> goodses = goodsService.getHasUpById(id); //调用业务层方法
        model.addAttribute("goodses",goodses);//把从数据库取到的数据放入到model中
        return "business/goodsHasUp";
    }

    //已下架
    @RequestMapping(value="/goodsHasDown")
    public String goodsHasDown(@RequestParam(value = "id",required = false)String id, HttpSession httpSession, Model model){
        id = (String) httpSession.getAttribute("UserId");
        List<Goods> goodses = goodsService.getHasDownById(id); //调用业务层方法
        model.addAttribute("goodses",goodses);//把从数据库取到的数据放入到model中
        return "business/goodsHasDown";
    }

    //缺货
    @RequestMapping(value="/goodsHasOver")
    public String goodsHasOver(@RequestParam(value = "id",required = false)String id, HttpSession httpSession, Model model){
        id = (String) httpSession.getAttribute("UserId");
        List<Goods> goodses = goodsService.getHasOverById(id); //调用业务层方法
        model.addAttribute("goodses",goodses);//把从数据库取到的数据放入到model中
        return "business/goodsHasOver";
    }


    //返回json
//    @RequestMapping(value="/test",method = RequestMethod.GET)
//    @ResponseBody
//    public Map<String,Object> test(){
//        List<Goods> goodses = goodsService.getAll(); //调用业务层方法
//        Map<String, Object> modelMap = new HashMap<String, Object>();
//        modelMap.put("userlist",goodses);
//        return modelMap;
//    }

    @RequestMapping(value = "")
    public String welcome(){
        return "business/welcome";
    }

}
