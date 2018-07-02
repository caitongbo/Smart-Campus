package com.smartcampus.dao;

import com.smartcampus.entity.Card;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CardMapper {
    @Select("select id,card_vid as cardVid,card_balance as cardBalance,sq_id as sqId,auth_id as authId,state from card")
    List<Card> findAll();

    @Select("select id,card_vid as cardVid,card_balance as cardBalance,sq_id as sqId,auth_id as authId,state from card where state='0'")
    List<Card> findUnavailable();

    @Select("select card.id,card_vid as cardVid,card_balance as cardBalance,sq_id as sqId,card.auth_id as authId,card.state from card,user where user.uuid=card.id and user.id=#{id}")
    Card findById(String id);
}