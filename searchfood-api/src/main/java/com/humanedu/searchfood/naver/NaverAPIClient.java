package com.humanedu.searchfood.naver;

import com.humanedu.searchfood.naver.dto.SearchRegionRequestDto;
import com.humanedu.searchfood.naver.dto.SearchRegionResponseDto;
import org.springframework.stereotype.Component;

@Component
public class NaverAPIClient {
    // 1. 지역검색 API Call method(request dto, response dto)
    public SearchRegionResponseDto searchRegion(
            SearchRegionRequestDto searchRegionRequestDto) {
        return null;
    }
}
