package org.MealKit.domain;

import lombok.Data;

@Data
public class InstructionVO {
    private int lot_id;
    private String emp_nm;
    private int emp_id;
    private int inst_id;
    private String inst_nm;
    private int product_id;
    private int lot_size;
    private int output;
    private String inst_date;
    private String manu_date;
    private int manu_id;
    private String manu_nm;
    private String completion;
}
