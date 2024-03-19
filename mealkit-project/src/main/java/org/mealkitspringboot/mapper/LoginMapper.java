package org.mealkitspringboot.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.mealkitspringboot.domain.EmployeesVO;

@Mapper
public interface LoginMapper {
    EmployeesVO login(@Param("empId") int empId, @Param("empPw") String empPw); // 로그인
    void updateMyPage(@Param("empId") int empId, @Param("empPw") String empPw, @Param("empContact") String empContact); // 마이페이지

    EmployeesVO findPassword(@Param("empId") int empId, @Param("empContact") String empContact);
}
