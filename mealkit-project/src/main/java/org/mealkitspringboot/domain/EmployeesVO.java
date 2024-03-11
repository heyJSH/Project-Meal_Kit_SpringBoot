package org.mealkitspringboot.domain;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmployeesVO {
    private int emp_id;
    private String emp_pw;
    private int emp_nm;
    private String emp_contact;
    private String dep_id;
    private int dep_nm;
    private String emp_role;
}
