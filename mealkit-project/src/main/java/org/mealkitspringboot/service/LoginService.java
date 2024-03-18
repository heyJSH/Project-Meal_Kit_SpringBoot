package org.mealkitspringboot.service;
import org.mealkitspringboot.domain.EmployeesVO;

    public interface LoginService {
        public EmployeesVO login(int empId, String empPw);
        public EmployeesVO selectMyPage(int empId, String empNm);        // 마이페이지 상세조회
        int updateMyPage(int empId,
                         String empPw,
                         String empContact);
    }

