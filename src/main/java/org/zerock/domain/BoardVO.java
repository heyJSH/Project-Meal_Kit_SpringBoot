package org.zerock.domain;

import java.util.Date;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class BoardVO {
  private int order_num;
  private int cust_id;
  private String cust_name;
  private int product_id;
  private String product_name;
  private int quantity;
  private String order_date;
  private String requst_date;
  private int emp_id;
  private String emp_nm;
}
