package com.smartcampus.serviceImpl;

import com.smartcampus.dao.ShopInfoMapper;
import com.smartcampus.entity.ShopInfo;
import com.smartcampus.service.ShopInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopInfoServiceImpl implements ShopInfoService {
    @Autowired
    private ShopInfoMapper shopInfoMapper;

    public ShopInfo getNameAndAddrById(String id) {
        return shopInfoMapper.findNameAndAddrById(id);
    }
}
