package org.mealkitspringboot.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.mealkitspringboot.domain.EmployeesVO;
import org.mealkitspringboot.domain.NoticeVO;

public interface LoginMapper {
    EmployeesVO findByEmpIdAndEmpPw(@Param("empId") int empId, @Param("empPw") String empPw); // 로그인
    EmployeesVO getMyPage(int empId, String empNm);           // 마이페이지 조회
    int updateMyPage(EmployeesVO employeesVO);  // 마이페이지 수정


}