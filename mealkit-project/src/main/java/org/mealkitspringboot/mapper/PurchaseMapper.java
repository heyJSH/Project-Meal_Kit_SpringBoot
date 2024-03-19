package org.mealkitspringboot.mapper;


import org.apache.ibatis.annotations.Param;
import org.mealkitspringboot.domain.PurchaseVO;
import org.springframework.context.annotation.Bean;
import java.util.List;

public interface PurchaseMapper {
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
