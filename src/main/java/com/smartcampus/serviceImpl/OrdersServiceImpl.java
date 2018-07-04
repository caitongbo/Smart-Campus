package com.smartcampus.serviceImpl;

import com.smartcampus.dao.OrdersMapper;
import com.smartcampus.entity.Orders;
import com.smartcampus.service.OrdersService;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService {
    @Autowired
    private OrdersMapper ordersMapper;

    public void save(String uuid,Integer id){ordersMapper.save(uuid,id);}

    public List<Orders> getById(String id) {
        return ordersMapper.findById(id);
    }
}
