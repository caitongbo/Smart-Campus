package com.smartcampus.controller;

import com.smartcampus.entity.ShopInfo;
import com.smartcampus.service.ShopInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
/**
 * 商家信息的Controller层
 *
 */
@Controller
@RequestMapping("/shop")
public class ShopInfoController {

    @Autowired
    private ShopInfoService shopInfoService;

    //获取商家登陆的商家信息
    @RequestMapping(value="/shopInfo")
    public String shopInfo(@RequestParam(value = "id",required = false)String id, HttpSession httpSession, Model model){
        id = (String) httpSession.getAttribute("UserId");
        ShopInfo shopInfo = shopInfoService.getNameAndAddrById(id); //调用业务层方法
        httpSession.setAttribute("ShopInfo",shopInfo);
        model.addAttribute("shopNameAndAddr",shopInfo);//把从数据库取到的数据放入到model中
        return "business/shopInfo";
    }

//    //返回json
//    @RequestMapping(value="/test",method = RequestMethod.GET)
//    @ResponseBody
//    public Map<String,Object> test(){
//        List<ShopInfo> shopInfos = shopInfoService.getNameAndAddr(); //调用业务层方法
//        Map<String, Object> modelMap = new HashMap<String, Object>();
//        modelMap.put("userlist",shopInfos);
//        return modelMap;
//    }

}
