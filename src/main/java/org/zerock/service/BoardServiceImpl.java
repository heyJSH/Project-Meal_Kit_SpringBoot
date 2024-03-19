package org.zerock.service;

import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;

import java.util.List;

@Service
@Log4j
public class BoardServiceImpl implements BoardService {
  @Autowired
  private BoardMapper boardMapper;

  @Override
  public List<BoardVO> readBoardList(){
    List<BoardVO> boardVOList = null;
    boardVOList = boardMapper.readBoardList();

    return boardVOList;
  }


  @Override
  public int updateBoard(
      int order_num,
      int cust_id,
      String cust_name,
      int product_id,
      String product_name,
      int quantity) {

    BoardVO boardVO = new BoardVO();

    boardVO.setOrder_num(order_num);
    boardVO.setCust_id(cust_id);
    boardVO.setCust_name(cust_name);
    boardVO.setProduct_id(product_id);
    boardVO.setProduct_name(product_name);
    boardVO.setQuantity(quantity);

    return boardMapper.updateBoard(boardVO);
  }


  @Override
  public int insertBoard(
      int order_num,
      int cust_id,
      String cust_name,
      int product_id,
      String product_name,
      int quantity,
      String order_date,
      String requst_date,
      int emp_id,
      String emp_nm
  ) {
    BoardVO boardVO = new BoardVO();

    boardVO.setOrder_num(order_num);
    boardVO.setCust_id(cust_id);
    boardVO.setCust_name(cust_name);
    boardVO.setProduct_id(product_id);
    boardVO.setProduct_name(product_name);
    boardVO.setQuantity(quantity);
    boardVO.setOrder_date(order_date);
    boardVO.setRequst_date(requst_date);
    boardVO.setEmp_id(emp_id);
    boardVO.setEmp_nm(emp_nm);


  int rtn = boardMapper.insertBoard(boardVO);
  return rtn;
  }



  @Override
  public int deleteBoard(int order_num) {
    return boardMapper.delBoard(order_num);
  }
}
