package org.mealkitspringboot.service;

import org.mealkitspringboot.domain.BomInsertDto;
import org.mealkitspringboot.domain.BomListDto;
import org.mealkitspringboot.domain.BomModifyDto;
import org.mealkitspringboot.domain.CriteriaDto;

import java.util.List;

public interface BomService {
    List<BomListDto> getProdNmList();               // select option 제품명
    List<BomListDto> getProdDivList();              // select option 제품 규격
    List<BomListDto> getMatNmList();                // select option 재료명
    List<BomListDto> getList(CriteriaDto cri);      // BOM 목록 조회(검색 기능 포함)
   /* int getCurrval();*/
    boolean modify(BomModifyDto bomListDto);        // BOM 수정
    boolean remove(Long bomId, Long matId);         // BOM 삭제
    int getTotalCount(Long listSeq);                // BOM 전체 개수 조회(무한 스크롤에 사용)

    void registerBom(BomInsertDto bomInsertDto) throws Exception;        // BOM 작성
}
