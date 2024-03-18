package org.mealkitspringboot.service;

import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.mealkitspringboot.domain.PurchaseVO;

import org.mealkitspringboot.mapper.PurchaseMapper;

import java.util.List;

@Log4j
@Service
public class purchaseServiceImpl implements purchaseService{
    @Autowired
    private PurchaseMapper mapper;

    @Override
    public List<PurchaseVO> modifymaterialservice(){
        return mapper.modifymaterial();
    }


}
