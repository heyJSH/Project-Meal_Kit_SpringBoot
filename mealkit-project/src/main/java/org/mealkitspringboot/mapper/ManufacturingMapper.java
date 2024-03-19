package org.MealKit.mapper;

import org.MealKit.domain.*;
import java.util.List;

public interface ManufacturingMapper {
    List<ManufacturingVO> selectManufacturing();

    List<FinishedProductVO> selectManuProd();

    List<ManuMateVO> selectManuMate(int product_id);

    int updateManuProd(int new_quantity, int lot_id);

    int updateManuMate(ManuMateVO manuMateVO);

    int updateInstruction(InstructionVO instructionVO);

    int deleteManufacturing(int lot_id);

    EmployeesVO findEmployeeById(int empId);

    FinishedProductVO findProductQuantity(int productId);
}
