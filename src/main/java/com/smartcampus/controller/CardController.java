package com.smartcampus.controller;

import com.smartcampus.entity.Card;
import com.smartcampus.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
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

    //学生申请一卡通
    @RequestMapping("applyS")
    public String applyS(HttpServletRequest request, HttpSession httpSession , Model model){
        String cardVid = (String) httpSession.getAttribute("UserUuid");
        String sqId = (String) httpSession.getAttribute("UserId");
        String balance=request.getParameter("balance");
        Integer authId=1;
         cardService.save(cardVid,balance,sqId,authId);
         model.addAttribute("message","申请已提交，请等待审核完毕后查看使用，谢谢");
        return "student/message";
    }

    //教师申请一卡通
    @RequestMapping("applyT")
    public String applyT(HttpServletRequest request, HttpSession httpSession , Model model){
        String cardVid = (String) httpSession.getAttribute("UserUuid");
        String sqId = (String) httpSession.getAttribute("UserId");
        String balance=request.getParameter("balance");
        Integer authId=0;
        cardService.save(cardVid,balance,sqId,authId);
        model.addAttribute("message","申请已提交，请等待审核完毕后查看使用，谢谢");
        return "teacher/message";
    }

    //一卡通学生申请记录
    @RequestMapping("recordS")
    public String recordS(HttpSession httpSession,Model model){
        String id = (String) httpSession.getAttribute("UserId");
        List<Card> cards = cardService.getRecord(id);
        model.addAttribute("cards",cards);
        return "student/applyRecord";
    }
    //一卡通老师申请记录
    @RequestMapping("recordT")
    public String recordT(HttpSession httpSession,Model model){
        String id = (String) httpSession.getAttribute("UserId");
        List<Card> cards = cardService.getRecord(id);
        model.addAttribute("cards",cards);
        return "teacher/applyRecord";
    }

    //批准申请
    @RequestMapping("approve")
    public String approve(@RequestParam int id,Model model){
        Integer cardId = Integer.valueOf(id);
        cardService.getApprove(cardId,"1");
        model.addAttribute("message","已批准");
        return "teacher/message";
    }
    //拒绝申请
    @RequestMapping("reject")
    public String reject(@RequestParam int id,Model model){
        Integer cardId = Integer.valueOf(id);
        cardService.getApprove(cardId,"0");
        model.addAttribute("message","已拒绝");
        return "teacher/message";
    }

    //删除此卡
    @RequestMapping("delete")
    public String delete(@RequestParam int id,Model model){
        Integer cardId = Integer.valueOf(id);
        cardService.delete(cardId);
        model.addAttribute("message","已删除");
        return "teacher/message";
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
