package org.zerock.service;

import org.zerock.domain.BoardVO;

import java.util.List;

public interface BoardService {


  List<BoardVO> readBoardList();

  int insertBoard(
      int order_num,
      int cust_id,
      String cust_name,
      int product_id,
      String product_name,
      int quantity,
      String order_date,
      String requst_date,
      int emp_id,
      String emp_nm);

  int updateBoard(
      int order_num,
      int cust_id,
      String cust_name,
      int product_id,
      String product_name,
      int quantity);

  int deleteBoard(int order_num);

}





