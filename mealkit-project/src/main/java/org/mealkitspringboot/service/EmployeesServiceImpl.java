package org.MealKit.service;

import lombok.extern.log4j.Log4j;
import org.MealKit.domain.EmployeesVO;
import org.MealKit.mapper.EmployeesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Log4j
@Service
public class EmployeesServiceImpl implements EmployeesService{
    @Autowired
    private EmployeesMapper employeesMapper;

    @Override
    public List<EmployeesVO> selectEmployees() {
        List<EmployeesVO> employeesVOList = employeesMapper.selectEmployees();
        return employeesVOList;
    }

    @Override
    public int insertEmployees(String emp_nm, String emp_contact, int dep_id, String dep_nm, String emp_role) {
        EmployeesVO employeesVO = new EmployeesVO();
        employeesVO.setEmp_nm(emp_nm);
        employeesVO.setEmp_contact(emp_contact);
        employeesVO.setDep_id(dep_id);
        employeesVO.setDep_nm(dep_nm);
        employeesVO.setEmp_role(emp_role);
        int rtn = employeesMapper.insertEmployees(employeesVO);
        return rtn;
    }
}
