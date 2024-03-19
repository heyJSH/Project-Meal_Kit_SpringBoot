package org.mealkitspringboot.domain;

import lombok.Data;

@Data
public class BomModifyDto {
    private Long editData2;         // bomId
    private Long editData3;         // prodId
    private String editData4;       // 제품명
    private String editData5;       // 제품 종류(prodDiv)
    private String editData6;       // 제품 규격(prodSpec)
    private Long editData7;         // lotId
    private Long editData8;         // Lot Size
    private String editData9;       // 재료 종류(MATERIAL_CLASSIFICATION)
    private Long editData10;        // matId(재료 코드)
    private String editData11;      // 재료명
    private String editData12;      // 단위(Quantity Units)
    private Long editData13;        // 수량(bom_prod_quantity)
}
