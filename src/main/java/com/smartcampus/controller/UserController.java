package com.smartcampus.controller;

import com.smartcampus.entity.User;
import com.smartcampus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * 用户的控制层
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {

    //注入service
    @Autowired
    private UserService userService;

    /**
     * 用户登录
     */
    @RequestMapping(value = "/login")
    public String login(@RequestParam(value="id",required=false)  String id, @RequestParam(value="password",required=false)  String password, HttpSession httpSession, Model model) {
        User user = userService.login(id);
        if (user != null) {
            System.out.println(user.getId());
            System.out.println(user.getPassword());
            System.out.println(user.getShopType());
            if (user.getPassword().equals(password)) {
                //登录成功
                httpSession.setAttribute("user",user);
                httpSession.setAttribute("UserId",user.getId());
                httpSession.setAttribute("UserUuid",user.getUuid());
                model.addAttribute("message",user.getId());
                if ("0".equals(user.getShopType()))
                {
                    return "student/main";}
                else  if ("-1".equals(user.getShopType()))   return "business/main";
                else return "teacher/main";
            } else {
                model.addAttribute("message", "登录失败");
                return "login";
            }
        } else {
            model.addAttribute("message", "你输入的用户名或密码有误");
            return "login";
        }
    }

    //返回个人账户信息
    @RequestMapping("/userS")
    public String userS(){
        return "student/myInformation";
    }

    @RequestMapping("/userT")
    public String userT(){
        return "teacher/myInformation";
    }

    @RequestMapping("/userB")
    public String userB(){
        return "business/myInformation";
    }
}
