package org.mealkitspringboot.mapper;

import org.mealkitspringboot.domain.*;
import java.util.List;

public interface InstructionMapper {
    List<FinishedProductVO> selectInstProd();

    List<InstructionVO> selectInstruction();

    int insertInstruction(InstructionVO instructionVO);

    int insertManufacturing(ManufacturingVO manufacturingVO);

    EmployeesVO findEmployeeById(int empId);

    FinishedProductVO findProductById(int productId);
}
