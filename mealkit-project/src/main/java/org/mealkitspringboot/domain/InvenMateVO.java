package org.MealKit.domain;

import lombok.Data;

@Data
public class InvenMateVO {
    private int material_id;
    private String material_nm;
    private int material_quantity;
    private String quantity_units;
}
