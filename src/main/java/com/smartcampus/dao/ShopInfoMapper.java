package com.smartcampus.dao;

import com.smartcampus.entity.ShopInfo;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ShopInfoMapper {

    @Select("select shop_name as shopName,show_addr as showAddr,shop_info.state from shop_info,user where shop_info.uuid=user.uuid and user.id=#{id}")
    ShopInfo findNameAndAddrById(String id);
}