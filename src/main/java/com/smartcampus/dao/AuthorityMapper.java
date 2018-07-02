package com.smartcampus.dao;

import com.smartcampus.entity.Authority;

public interface AuthorityMapper {
    int insert(Authority record);

    int insertSelective(Authority record);
}