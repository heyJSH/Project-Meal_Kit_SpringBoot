package org.zerock.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class exceptionAdvice {
  @ExceptionHandler(Exception.class)
  public String except(Exception ex, Model model){
    model.addAttribute("exception", ex);
    System.out.println("exception: "+ ex.getMessage());

    return "error_page";
  }
}
