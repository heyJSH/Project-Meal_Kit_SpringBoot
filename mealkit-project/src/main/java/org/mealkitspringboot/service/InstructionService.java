package org.MealKit.service;

import org.MealKit.domain.FinishedProductVO;
import org.MealKit.domain.InstructionVO;
import java.util.List;

public interface InstructionService {
    List<FinishedProductVO> selectInstProd();

    List<InstructionVO> selectInstruction();

    int insertInstruction(int inst_id,
                          int product_id,
                          int lot_size,
                          String inst_date);

    int insertManufacturing(int inst_id,
                            int product_id,
                            int lot_size,
                            String inst_date);

    boolean checkInstId(int empId);

    boolean checkProductId(int productId);
}
