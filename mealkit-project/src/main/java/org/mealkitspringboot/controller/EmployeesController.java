package org.MealKit.controller;

import lombok.extern.log4j.Log4j;
import org.MealKit.domain.EmployeesVO;
import org.MealKit.service.EmployeesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;

@Controller
@Log4j
public class EmployeesController {
    @Autowired
    private EmployeesService employeesService;

    @GetMapping("/employees")
    public String employees(
            Model model){
        List<EmployeesVO> employeesVOList = employeesService.selectEmployees();
        model.addAttribute("employeesVOList",employeesVOList);
        return "employees";
    }

    @PostMapping("/employees_btn")
    public String employees_btn(
            @RequestParam("emp_nm") String emp_nm,
            @RequestParam("emp_contact") String emp_contact,
            @RequestParam("dep_id") int dep_id,
            @RequestParam("dep_nm") String dep_nm,
            @RequestParam("emp_role") String emp_role,
            RedirectAttributes rttr){
        int rtn = employeesService.insertEmployees(
                emp_nm,
                emp_contact,
                dep_id,
                dep_nm,
                emp_role);
        rttr.addFlashAttribute("insertEmployees",rtn);
        return "redirect:/employees";
    }
}
