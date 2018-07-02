package com.smartcampus.dao;

import com.smartcampus.entity.Orders;
import org.apache.ibatis.annotations.Select;


public interface OrdersMapper {
    @Select("select goods.g_name as gName,goods.g_price as gPrice,goods.g_ly as gLy,goods.g_vid as gVid,goods.g_label as gLabel from orders,user,goods where user.uuid=orders.user_uuid and  orders.g_id=goods.id and user.id=#{id}")
    Orders findById(String id);
}