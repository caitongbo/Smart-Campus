package com.smartcampus.service;

import com.smartcampus.entity.Card;

import java.util.List;

public interface CardService {
    List<Card> getAll();

    List<Card> getUnavailable();

    Card getById(String id);

    void save(String uuid,String balance,String id,Integer authId);

    List<Card> getRecord(String id);

    void  getApprove(Integer id,String up);

    int delete(int id);

    void update(String id,String balance);

}
