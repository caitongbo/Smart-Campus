package com.smartcampus.service;

import com.smartcampus.entity.Goods;

import java.util.List;

public interface GoodsService {

    List<Goods> getAllById(String id);

    List<Goods> getHasUpById(String id);

    List<Goods> getHasDownById(String id);

    List<Goods> getHasOverById(String id);

}
