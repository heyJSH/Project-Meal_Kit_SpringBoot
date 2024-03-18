package org.mealkitspringboot.domain;

import lombok.Data;

import java.util.Date;

@Data
public class PurchaseVO {
    private Long material_Id;
    private String material_Nm;
    private String material_Classification;
    private Long material_Quantity;

    private Long purchase_Id;
    private Date purchase_Date;
    private String supplier;
    private String product_Name;
    private Long product_Quantity;
    private Date purchase_Fixed_Date;

    private Long sup_Id;
    private String sup_Name;
    private String phone_Num;
    private String sup_Address;
    private String sup_Email;
    private String sup_Sell;



}
