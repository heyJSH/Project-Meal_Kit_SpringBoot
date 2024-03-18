package org.mealkitspringboot.mapper;


import org.mealkitspringboot.domain.PurchaseVO;
import org.springframework.context.annotation.Bean;
import java.util.List;

public interface PurchaseMapper {

    List<PurchaseVO> modifymaterial();        // 재료 수정 페이지 처리

}
