package org.zerock.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import java.util.Date;
import java.util.List;


@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/board")
public class BoardController {

  @Autowired
  private BoardService service;



  //조회
  @GetMapping("/selector")
  public String board(Model model){
    List<BoardVO> boardVOList = service.readBoardList();
    model.addAttribute("boardVOList", boardVOList);
    return "/board/selector";
  }

  //입력
  @GetMapping("/inserter")
  public void inserter(){


  }

  @PostMapping("/inserter")
  public String inserter2(
      int order_num,
      int cust_id,
      String cust_name,
      int product_id,
      String product_name,
      int quantity,
      String order_date,
      String requst_date,
      int emp_id,
      String emp_nm,
      RedirectAttributes rttr){

    int rtn = service.insertBoard(
        order_num,
        cust_id,
        cust_name,
        product_id,
        product_name,
        quantity,
        order_date,
        requst_date,
        emp_id,
        emp_nm);

    rttr.addFlashAttribute("insertBoard", rtn);

    return "redirect:/board/selector";
  }

  //수정
  @GetMapping("/updater")
  public void updater(){

  }
    @PostMapping("/updater")
  public String updater(
        @RequestParam("order_num")  int order_num,
        @RequestParam("cust_id")  int cust_id,
        @RequestParam("cust_name")  String cust_name,
        @RequestParam("product_id")  int product_id,
        @RequestParam("product_name")  String product_name,
        @RequestParam("quantity")  int quantity,
        RedirectAttributes rttr){

    int rtn = service.updateBoard(
        order_num,
        cust_id,
        cust_name,
        product_id,
        product_name,
        quantity);
    rttr.addFlashAttribute("updateBoard", rtn);

    return "redirect:/board/selector";
  }

  //삭제
  @RequestMapping(value = "/deleter", method = {RequestMethod.GET, RequestMethod.POST})
  public String deleter(@RequestParam("order_num") int order_num, RedirectAttributes rttr){
    log.info(order_num);
    int rtn = service.deleteBoard(order_num);
      rttr.addFlashAttribute("deleteSuccessCount",rtn);

    return "redirect:/board/selector";
    }

    @GetMapping("/main")
    public void main(){

    }

  }

