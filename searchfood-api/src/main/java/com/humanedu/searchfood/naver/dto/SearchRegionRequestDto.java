package com.humanedu.searchfood.naver.dto;

import lombok.Getter;
import lombok.Setter;

public class SearchRegionRequestDto {
  @Getter
  @Setter
  private String query;
  private Integer display = 1;
  private Integer start = 1;
  private String sort = "random";
}
