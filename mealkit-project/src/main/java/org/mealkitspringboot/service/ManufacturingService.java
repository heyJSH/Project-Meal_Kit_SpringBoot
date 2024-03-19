package org.MealKit.service;

import org.MealKit.domain.*;
import java.util.List;

public interface ManufacturingService {
    List<ManufacturingVO> selectManufacturing();

    List<FinishedProductVO> selectManuProd();

    List<ManuMateVO> selectManuMate(int product_id);

    int updateManuProd(int new_quantity,
                       int lot_id);

    int updateManuMate(int material_to_deduct,
                       int material_id);

    int updateInstruction(int output,
                          String manu_date,
                          int manu_id,
                          int lot_id);

    int deleteManufacturing(int lot_id);


    boolean checkManuId(int empId);

    int findProductQuantity(int productId);
}
