package org.mealkitspringboot.domain;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmployeesVO {
    private int emp_id;
    private String emp_pw;
    private String emp_nm;
    private String emp_contact;
    private int dep_id;
    private String dep_nm;
    private String emp_role;
}
