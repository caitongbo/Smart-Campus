package com.smartcampus.service;

import com.smartcampus.entity.Card;

import java.util.List;

public interface CardService {
    List<Card> getAll();

    List<Card> getUnavailable();

    Card getById(String id);
}
