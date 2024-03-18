package org.mealkitspringboot.service;

import org.mealkitspringboot.domain.EmployeesVO;
import org.mealkitspringboot.domain.NoticeVO;
import org.mealkitspringboot.mapper.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LoginServiceImpl implements LoginService {

    private final LoginMapper loginMapper;

    @Autowired
    public LoginServiceImpl(LoginMapper loginMapper) {
        this.loginMapper = loginMapper;
    }

    @Override
    @Transactional(readOnly = true) // 데이터베이스 읽기 전용 트랜잭션 설정
    public EmployeesVO login(int empId, String empPw) {

        EmployeesVO employee = loginMapper.findByEmpIdAndEmpPw(empId, empPw);
        if (employee != null) {
            // 조회된 직원 정보를 반환
            return employee;
        } else {
            // 해당하는 직원 정보가 없는 경우 null을 반환
            return null;
        }
    }

    // 마이페이지
    @Override
    public EmployeesVO selectMyPage(int empId, String empNm) {
        return loginMapper.getMyPage(empId,empNm);
    }

    @Override
    public int updateMyPage(int empId, String empPw, String empContact) {
        EmployeesVO EmployeesVO = new EmployeesVO();
        EmployeesVO.setEmp_id(empId);
        EmployeesVO.setEmp_pw(empPw);
        EmployeesVO.setEmp_contact(empContact);

        return loginMapper.updateMyPage(EmployeesVO);
    }
}