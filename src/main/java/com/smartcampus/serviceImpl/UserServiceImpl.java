package com.smartcampus.serviceImpl;

import com.smartcampus.dao.UserMapper;
import com.smartcampus.entity.User;
import com.smartcampus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    //注入
    @Autowired
    private UserMapper userMapper;

    /**
     * 用户登录的方法
     */
    public User login(String id) {
        return userMapper.login(id);
    }

}
