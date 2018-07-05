package com.smartcampus.service;

import com.smartcampus.entity.Orders;

import java.util.List;

public interface OrdersService {

    List<Orders> getById(String id);

    void save(String uuid, Integer id);

    int delete(int id);

    List<Orders> getByUuid(String uuid);

}
