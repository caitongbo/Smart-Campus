package com.smartcampus.controller;

import com.smartcampus.entity.Card;
import com.smartcampus.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
/**
 * 一卡通管理的Controller层
 *
 */
@Controller
@RequestMapping("/card")
public class CardController {
    @Autowired
    CardService cardService;
    //查询一卡通列表
    @RequestMapping("/cardList")
    public String cardList(Model model){
        List<Card> cards= cardService.getAll();
        model.addAttribute("cards",cards);
        return "teacher/cardList";
    }

    //查询一卡通状态为0的列表
    @RequestMapping("/unavailable")
    public String cardUnavailable(Model model){
        List<Card> cards = cardService.getUnavailable();
        model.addAttribute("cards",cards);
        return "teacher/cardUnavailable";
    }

    //学生登陆查看一卡通
    @RequestMapping("/myCardS")
    public String myCardS(@RequestParam(value = "id",required = false)String id, HttpSession httpSession, Model model){
        id = (String) httpSession.getAttribute("UserId");
        Card card=cardService.getById(id);
        httpSession.setAttribute("Card",card);
        model.addAttribute("Card",card);
        return "student/myCard";
    }
    //老师登陆查看一卡通
    @RequestMapping("/myCardT")
    public String myCardT(@RequestParam(value = "id",required = false)String id, HttpSession httpSession, Model model){
        id = (String) httpSession.getAttribute("UserId");
        Card card=cardService.getById(id);
        httpSession.setAttribute("Card",card);
        model.addAttribute("Card",card);
        return "teacher/myCard";
    }
}
