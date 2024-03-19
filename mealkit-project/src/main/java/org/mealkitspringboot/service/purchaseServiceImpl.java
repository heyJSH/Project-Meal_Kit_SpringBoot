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
    public List<PurchaseVO> materialInventory(){
        return mapper.materialInventory();
    }

    @Override
    public int materialDelete(Long material_Id){
        return mapper.materialDelete(material_Id);
    }
    @Override
    public int materialUpdate(PurchaseVO vo){

        return mapper.materialUpdate(vo);
    }
    @Override
    public int materialInsert(PurchaseVO vo){
        return mapper.materialInsert(vo);
    }

    @Override
    public List<PurchaseVO> materialInfoModifyFirst() {
        return mapper.materialInfoModifyFirst();
    }

    @Override
    public PurchaseVO materialInfoModifySecond(String material_Nm) {
        PurchaseVO secondList = mapper.materialInfoModifySecond(material_Nm);
        return secondList;
    }

    @Override
    public int materialModifyThird(PurchaseVO vo){
        return mapper.materialModifyThird(vo);
    }

    @Override
    public List<PurchaseVO> materialPurchaseSelectSupplier(String material_Nm){
        List<PurchaseVO> supplierList = mapper.materialPurchaseSelectSupplier(material_Nm);
        return supplierList;
    }

    @Override
    public int materialPurchase(PurchaseVO vo){
        return mapper.materialPurchase(vo);
    }

}
