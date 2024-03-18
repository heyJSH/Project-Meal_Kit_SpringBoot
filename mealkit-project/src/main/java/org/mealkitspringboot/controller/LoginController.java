package org.mealkitspringboot.controller;

import lombok.extern.log4j.Log4j;
import org.mealkitspringboot.domain.EmployeesVO;
import org.mealkitspringboot.domain.NoticeVO;
import org.mealkitspringboot.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Log4j
@SessionAttributes("employee") // 모델에 "employee"라는 이름으로 저장된 속성을 세션에 저장
public class LoginController {

    @Autowired
    private LoginService loginService;

    @GetMapping("/myPage")
    public String myPage(@RequestParam(value = "empId", required = false) int empId, @RequestParam(value = "empNm", required = false) String empNm, Model model) {
        EmployeesVO employeesVO = loginService.selectMyPage(empId, empNm);
        model.addAttribute("myPage", employeesVO);
        return "/users/myPage";
    }

    @PostMapping("/updateUserInfo")
    public String updateUserInfo(@RequestParam(value = "empId", required = false) Integer empId,
                                 @RequestParam("empPw") String empPw,
                                 @RequestParam("empContact") String empContact) {
        if (empId == null) {
            // empId가 없을 경우 처리할 내용 추가
            // 예를 들어 오류 메시지를 반환하거나 다른 처리를 수행할 수 있습니다.
            return "errorPage"; // 예시로 errorPage로 이동하도록 설정
        }

        // 비밀번호와 전화번호를 업데이트하는 서비스 메서드 호출
        loginService.updateMyPage(empId, empPw, empContact);

        // 업데이트 후에 마이페이지로 리다이렉트
        return "redirect:/users/myPage?empId=" + empId;
    }


    @GetMapping("/index")
    public String index(){
        return "/index";
    }

    @GetMapping("/login")
    public String login() {
        return "users/login"; // login.html 페이지로 리다이렉션
    }

    @PostMapping("/login")
    public String loginProcess(@RequestParam("empId") String empId, @RequestParam("empPw") String empPw, Model model) {
        EmployeesVO employee = loginService.login(Integer.parseInt(empId), empPw);
        if(employee != null) {
            return "index"; // 로그인 성공 시 홈페이지로 리다이렉션
        } else {
            return "users/login"; // 로그인 실패 시 로그인 페이지로 돌아감
        }
    }

    @GetMapping("/logout")
    public String logout(SessionStatus status) {
        status.setComplete(); // 세션 종료
        log.info("종료");
        return "users/login"; // 로그인 실패 시 로그인 페이지로 돌아감
    }

}