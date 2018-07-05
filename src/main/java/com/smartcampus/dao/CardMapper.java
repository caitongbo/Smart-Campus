package com.smartcampus.dao;

import com.smartcampus.entity.Card;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CardMapper {
    @Select("select id,card_vid as cardVid,card_balance as cardBalance,sq_id as sqId,auth_id as authId,state from card")
    List<Card> findAll();

    @Select("select id,card_vid as cardVid,card_balance as cardBalance,sq_id as sqId,auth_id as authId,state from card where state='0'")
    List<Card> findUnavailable();

    @Select("select card.id,card_vid as cardVid,card_balance as cardBalance,sq_id as sqId,card.auth_id as authId,card.state from card,user where user.id=card.sq_id and user.id=#{id}")
    Card findById(@Param("id") String id);

    @Insert("insert into card (card_vid,card_balance,sq_id,auth_id,state) values (#{uuid},#{balance},#{id},#{authId},'0')")
    void save(@Param("uuid")String uuid,@Param("balance")String balance,@Param("id")String id,@Param("authId")Integer authId);
    
    @Select("select id,card_vid as cardVid,card_balance as cardBalance,sq_id as sqId,auth_id as authId,state from card where card.sq_id=#{id}")
    List<Card> findRecord(@Param("id")String id);

    @Update("update card set state=#{state} where id=#{id}")
    void setApprove(@Param("id")Integer id,@Param("state")String state);

    @Delete("delete from card where id=#{id}")
    int delete(@Param("id")int id);

    @Update("update card set card_balance=#{balance} where sq_id=#{id}")
    void update(@Param("id")String id,@Param("balance")String balance);
}