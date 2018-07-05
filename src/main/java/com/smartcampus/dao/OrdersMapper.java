package com.smartcampus.dao;

import com.smartcampus.entity.Orders;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;


public interface OrdersMapper {

    @Select("select goods.id as id,goods.g_name as gName,goods.g_price as gPrice,goods.g_ly as gLy,goods.g_vid as gVid,goods.g_label as gLabel,goods.g_details as gDetails from orders,user,goods where user.uuid=orders.user_uuid and  orders.g_id=goods.id and user.id=#{id}")
    List<Orders> findById(String id);

    @Insert("insert into orders (user_uuid,g_id) values (#{uuid},#{id})")
    void save(@Param("uuid")String uuid,@Param("id")Integer id);

    @Delete("delete from orders where g_id=#{id}")
    int delete(@Param("id")int id);

    @Select("select user.id as userId, goods.id as id,goods.g_name as gName,goods.g_price as gPrice,goods.g_ly as gLy,goods.g_vid as gVid,goods.g_label as gLabel,goods.g_details as gDetails from orders,user,goods where orders.g_id = goods.id and goods.s_i_uuid=#{uuid}")
    List<Orders> findByUuid(@Param("uuid")String uuid);

    }