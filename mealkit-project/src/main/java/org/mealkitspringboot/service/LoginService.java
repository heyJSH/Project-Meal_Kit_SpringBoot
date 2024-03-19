package org.mealkitspringboot.service;

import org.mealkitspringboot.domain.EmployeesVO;

public interface LoginService {
    EmployeesVO login(int empId, String empPw);    // 로그인
    void updateMyPage(int empId, String empPw, String empContact);  // 마이페이지
    EmployeesVO findPassword(int empId, String empContact);

}