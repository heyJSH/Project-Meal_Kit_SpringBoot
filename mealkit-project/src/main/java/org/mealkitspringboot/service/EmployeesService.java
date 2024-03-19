package org.MealKit.service;

import org.MealKit.domain.EmployeesVO;
import java.util.List;

public interface EmployeesService {
    List<EmployeesVO> selectEmployees();

    int insertEmployees(String emp_nm,
                        String emp_contact,
                        int dep_id,
                        String dep_nm,
                        String emp_role);
}
