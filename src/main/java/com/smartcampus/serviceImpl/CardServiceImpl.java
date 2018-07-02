package com.smartcampus.serviceImpl;

import com.smartcampus.dao.CardMapper;
import com.smartcampus.entity.Card;
import com.smartcampus.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardServiceImpl implements CardService {
    @Autowired
    private CardMapper cardMapper;

    public List<Card> getAll() {
        return cardMapper.findAll();
    }

    public List<Card> getUnavailable() {
        return cardMapper.findUnavailable();
    }

    public Card getById(String id){
        return cardMapper.findById(id);
    }
}
