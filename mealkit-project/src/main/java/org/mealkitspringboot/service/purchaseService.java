package org.mealkitspringboot.service;


import org.mealkitspringboot.domain.PurchaseVO;

import java.util.List;

public interface purchaseService {

    public List<PurchaseVO> materialInventory();

    public int materialDelete(Long material_Id);

    public int materialUpdate(PurchaseVO vo);

    public int materialInsert(PurchaseVO vo);

    public List<PurchaseVO> materialInfoModifyFirst();

    public PurchaseVO materialInfoModifySecond(String material_Nm);

    public int materialModifyThird(PurchaseVO vo);

    public List<PurchaseVO> materialPurchaseSelectSupplier(String material_Nm);

    public int materialPurchase(PurchaseVO vo);
}
