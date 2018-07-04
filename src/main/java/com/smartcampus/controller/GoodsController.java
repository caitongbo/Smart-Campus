package com.smartcampus.controller;

import com.smartcampus.entity.Goods;
import com.smartcampus.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

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

    //学生所有商品信息
    @RequestMapping(value = "goodsAllListS")
    public String goodsAllListS(Model model){
        List<Goods> goods = goodsService.getAll();
        model.addAttribute("goods",goods);
        return "student/goodsList";
    }
    //教师所有商品信息
    @RequestMapping(value = "goodsAllListT")
    public String goodsAllListT(Model model){
        List<Goods> goods = goodsService.getAll();
        model.addAttribute("goods",goods);
        return "teacher/goodsList";
    }
    //个人商家所有商品信息
    @RequestMapping(value="/goodsAllListB")
    public String list(@RequestParam(value = "id",required = false)String id, HttpSession httpSession, Model model){
        id = (String) httpSession.getAttribute("UserId");
        List<Goods> goodses = goodsService.getAllById(id); //调用业务层方法
        model.addAttribute("goodses",goodses);//把从数据库取到的数据放入到model中
    return "business/goodsList";
    }
    //根据id查询商品
    @ResponseBody
    @RequestMapping(value="/findById")
    public Goods findById(@RequestBody Goods goods,Model model){
        Goods goods_info = goodsService.getById(goods.getId());
        model.addAttribute("GoodsId",goods.getId());
        if(goods_info != null){
            return goods_info;
        }else{
            return null;
        }
    }
    //上架
    @RequestMapping("up")
    public String up(@RequestParam int id,Model model){
            Integer goodsId = Integer.valueOf(id);
            goodsService.getUp(goodsId,"1");
            model.addAttribute("message","上架完成");
            return "business/message";
    }
    //下架
    @RequestMapping("down")
    public String down(@RequestParam int id,Model model){
        Integer goodsId = Integer.valueOf(id);
        goodsService.getUp(goodsId,"0");
        model.addAttribute("message","下架完成");
        return "business/message";
    }
    //缺货
    @RequestMapping("lose")
    public String lose(@RequestParam int id, Model model){
        Integer goodsId = Integer.valueOf(id);
        goodsService.getUp(goodsId,"-1");
        model.addAttribute("message","缺货完成");
        return "business/message";
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

}
