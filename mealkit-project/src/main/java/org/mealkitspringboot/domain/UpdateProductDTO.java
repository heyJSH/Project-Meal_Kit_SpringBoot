package org.MealKit.domain;

import lombok.Data;

@Data
public class UpdateProductDTO {
    private int lot_id;
    private int product_id;
    private int lot_size;
}
