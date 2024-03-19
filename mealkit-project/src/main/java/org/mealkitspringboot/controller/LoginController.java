package org.mealkitspringboot.controller;

import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j;
import org.mealkitspringboot.domain.EmployeesVO;
import org.mealkitspringboot.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Component
@Log4j
@SessionAttributes("employee") // 모델에 "employee"라는 이름으로 저장된 속성을 세션에 저장
public class LoginController {

    @Autowired
    private LoginService loginService;

    @GetMapping("/index")
    public String index(){
        return "/index";
    }

    // 로그인 & 접근제한
    @GetMapping("/login")
    public String login() {
        return "users/login"; // login.html 페이지로 리다이렉션
    }

    @PostMapping("/login")
    public String login(@RequestParam("empId") int empId, @RequestParam("empPw") String empPw,
                        HttpSession session, RedirectAttributes redirectAttributes) {

        EmployeesVO user = loginService.login(empId, empPw);

        if (user != null) {
            session.setAttribute("employee", user); // 세션에 사용자 정보 저장
            session.setAttribute("depNm", user.getDep_nm()); // 세션에 부서명 저장
            return "redirect:/index"; // 로그인 성공 시 인덱스 페이지로 리다이렉션
        } else {
            redirectAttributes.addFlashAttribute("error", "Invalid username or password");
            return "redirect:/login"; // 로그인 실패 시 로그인 페이지로 리다이렉션
        }
    }

    // 마이페이지
    @GetMapping("/myPage")
    public String myPage(Model model, HttpSession session) {
        // 세션에서 employee 객체를 가져옴
        EmployeesVO employee = (EmployeesVO) session.getAttribute("employee");
        // 세션에 employee 객체가 없으면 로그인 페이지로 리다이렉트
        if (employee == null) {
            return "redirect:/login";
        }
        // 사용자 정보를 모델에 추가하여 마이페이지에 전달
        model.addAttribute("myPage", employee);
        return "/users/myPage";
    }

    @PostMapping("/updateUserInfo")
    public String updateUserInfo(HttpSession session,
                                 @RequestParam("empPw") String empPw,
                                 @RequestParam("empContact") String empContact,
                                 RedirectAttributes redirectAttributes) {
        // 세션에서 employee 객체를 가져옴
        EmployeesVO employee = (EmployeesVO) session.getAttribute("employee");
        // 세션에 employee 객체가 없으면 로그인 페이지로 리다이렉트
        if (employee == null) {
            return "redirect:/login";
        }
        // 세션에서 empId를 가져옴
        Integer empId = employee.getEmp_id();
        // 비밀번호와 전화번호를 업데이트하는 서비스 메서드 호출
        loginService.updateMyPage(empId, empPw, empContact);
        // 정보 업데이트 후, 성공 메시지 추가
        redirectAttributes.addFlashAttribute("successMessage", "정보가 성공적으로 업데이트되었습니다.");
        // 업데이트 후에 마이페이지로 리다이렉트
        return "redirect:/myPage";
    }

    // 로그아웃
    @GetMapping("/logout")
    public String logout(SessionStatus status, HttpSession session) {
        session.removeAttribute("employee"); // 세션에서 사용자 정보 제거
        status.setComplete(); // 세션 종료
        log.info("로그아웃");
        return "redirect:/login"; // 로그아웃 후 로그인 페이지로 리다이렉션
    }

    // 비밀번호 찾기

    @PostMapping("/findPassword")
    public String findPassword(@RequestParam("empId") int empId, @RequestParam("empContact") String empContact) {
        EmployeesVO empPw = loginService.findPassword(empId, empContact);
        if (empPw != null) {
            // 비밀번호를 찾은 경우
            return "redirect:/login?message=Your password is " + empPw;
        } else {
            // 비밀번호를 찾지 못한 경우
            return "redirect:/login";
        }
    }
}