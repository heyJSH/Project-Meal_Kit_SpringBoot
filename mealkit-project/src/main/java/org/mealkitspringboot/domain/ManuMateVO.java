package org.MealKit.domain;

import lombok.Data;

@Data
public class ManuMateVO {
    private int material_id;
    private String material_nm;
    private int material_quantity;
    private int bom_prod_quantity;
    private String quantity_units;
    private String manufacturing_availability;
    private int material_to_deduct;
}
