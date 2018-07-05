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

    public void save(String uuid,String balance,String id,Integer authId){cardMapper.save(uuid,balance,id,authId);}

    public List<Card> getRecord(String id){return cardMapper.findRecord(id);}

    public void getApprove(Integer id,String state){ cardMapper.setApprove(id,state);}

    public int delete(int id) {
        return cardMapper.delete(id);
    }

    public void update(String id,String balance){cardMapper.update(id,balance);}
}
