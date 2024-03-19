package org.MealKit.mapper;

import org.MealKit.domain.EmployeesVO;
import java.util.List;

public interface EmployeesMapper {
    List<EmployeesVO> selectEmployees();

    int insertEmployees(EmployeesVO employeesVO);
}
