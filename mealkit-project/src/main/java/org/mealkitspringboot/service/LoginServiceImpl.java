package org.mealkitspringboot.service;

import org.mealkitspringboot.domain.EmployeesVO;
import org.mealkitspringboot.mapper.LoginMapper;
import org.mealkitspringboot.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginMapper loginMapper;

    @Override
    public EmployeesVO login(int empId, String empPw) {
        return loginMapper.login(empId, empPw);
    }

    @Override
    public void updateMyPage(int empId, String empPw, String empContact) {     // 마이페이지
        loginMapper.updateMyPage(empId, empPw, empContact);
    }

    @Override
    public EmployeesVO findPassword(int empId, String empContact) {
        return loginMapper.findPassword(empId, empContact);
    }

}