package com.smartcampus.dao;

import com.smartcampus.entity.User;
import org.apache.ibatis.annotations.Select;

public interface UserMapper {

    @Select("select uuid,id,password,state,type,auth_id as authId,shop_type as shopType from user where id=#{id}")
    User login(String id);
}