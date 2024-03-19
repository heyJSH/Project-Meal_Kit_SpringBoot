package org.mealkitspringboot.domain;

import lombok.Data;

@Data
public class BomInsertDto {
    private Long bomId;                 // BOM_ID (bom 테이블)
    private Long prodId;                // PRODUCT_ID (Finished_Product 테이블)
    private String prodNm;              // PRODUCT_NM
    private String prodDiv;             // PRODUCT_DIV (요리, 국/탕/찌개 등)
    private String prodSpec;            // PRODUCT_SPEC (1인, 2인 등)
    private Long prodPrice;             // PRODUCT_PRICE
    private Long lotId;                 // LOT_ID (Instruction 테이블)
    private Long lotSize;               // LOT_SIZE
    private String matDiv;              // MATERIAL_CLASSIFICATION (Material 테이블)
    private Long matId;                 // MATERIAL_ID
    private String matNm;               // MATERIAL_NM
    private String quantityUnits;       // BOM_PROD_QUANTITY (Bom 테이블)
    private Long bomProdQuantity;       // QUANTITY_UNITS (Bom 테이블)
    private Long supId;                 // SUP_ID (Supplier 테이블)
    private String supNm;               // SUP_NAME
    private String supContact;          // PHONE_NUM
    private String supAddress;          // SUP_ADDRESS
    private String supEmail;            // SUP_EMAIL
    private String supSell;             // SUP_SELL
}
