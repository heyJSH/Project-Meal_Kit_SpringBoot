package org.mealkitspringboot.mapper;

import org.mealkitspringboot.domain.*;

import java.util.List;

public interface BomMapper {
    List<BomListDto> getProdNmList();        // select option 제품명
    List<BomListDto> getProdDivList();     // select option 제품 규격
    List<BomListDto> getMatNmList();         // select option 재료명
    List<BomListDto> getList(CriteriaDto cri);   // BOM 전체 목록 조회(with 검색)
    int readCurrval();                      // 무한 스크롤(스크롤 위치 조회)
    int getCountByListSeq(Long listSeq);    // BOM 현황 전체 개수 조회(무한 스크롤에 사용)
    int delete(BomDeleteDto bomDeleteDto);       // BOM 삭제
    int update(BomModifyDto bom);              // BOM 수정

    /*List<BomListVo> getListWithSearch(@Param("cri") CriteriaVo cri);    // BOM 검색 조회*/

    /* 아래는 BOM 등록 트랜잭션을 위한 내용들 */
    BomInsertDto selectProd(BomInsertDto bomInsertDto);     // 제품 조회
    BomInsertDto selectMat(BomInsertDto bomInsertDto);      // 재료 조회
    BomInsertDto selectLot(BomInsertDto bomInsertDto);      // lot 정보 조회
    BomInsertDto selectBomId(BomInsertDto bomInsertDto);    // bomId 조회
    void insertProd(BomInsertDto bomInsertDto);             // 기존 제품 없을 경우, 제품 insert
    void insertMat(BomInsertDto bomInsertDto);              // 기존 재료 없을 경우, 재료 insert
    void insertSup(BomInsertDto bomInsertDto);              // 공급 업체 insert
    void insertLot(BomInsertDto bomInsertDto);              // 기존 lot 없을 경우, insert
    void insertBom1(BomInsertDto bomInsertDto);             // 기존 bom_id 있을 경우, 해당 id로 insert
    void insertBom2(BomInsertDto bomInsertDto);             // 기존 bom_id 없을 경우, 새로운 id로 insert


}
