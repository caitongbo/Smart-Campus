package com.smartcampus.serviceImpl;

import com.smartcampus.dao.OrdersMapper;
import com.smartcampus.entity.Orders;
import com.smartcampus.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrdersServiceImpl implements OrdersService {
    @Autowired
    private OrdersMapper ordersMapper;

    public Orders getById(String id) {
        return ordersMapper.findById(id);
    }
}
