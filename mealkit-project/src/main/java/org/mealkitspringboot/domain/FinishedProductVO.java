package org.MealKit.domain;

import lombok.Data;

@Data
public class FinishedProductVO {
    private int product_id;
    private String product_nm;
    private String product_div;
    private String product_spec;
    private int product_quantity;
    private int product_price;
}
