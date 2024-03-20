package com.humanedu.searchfood.naver.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchImageRequestDto {
    private String query;
    private Integer display = 1;
    private Integer start = 1;
    private String sort = "sim";
    private String filter = "all";
}
