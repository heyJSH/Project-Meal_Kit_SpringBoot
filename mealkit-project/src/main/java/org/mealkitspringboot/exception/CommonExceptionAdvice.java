package org.mealkitspringboot.exception;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Controller
public class CommonExceptionAdvice {
    @ExceptionHandler(Exception.class)
    public String except(Exception ex, Model model) {
        model.addAttribute("exception", ex);
        System.out.println("exception: "+ex.getMessage());
        return "error_page";
    }
}