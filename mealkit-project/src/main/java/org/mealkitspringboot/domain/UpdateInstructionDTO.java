package org.MealKit.domain;

import lombok.Data;

@Data
public class UpdateInstructionDTO {
    private int output;
    private String manu_date;
    private int emp_id;
    private int lot_id;
}
