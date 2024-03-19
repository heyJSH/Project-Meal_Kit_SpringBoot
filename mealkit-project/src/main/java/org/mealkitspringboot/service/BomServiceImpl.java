package org.mealkitspringboot.service;

import lombok.extern.log4j.Log4j;
import org.mealkitspringboot.domain.*;
import org.mealkitspringboot.mapper.BomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Log4j
@Service
public class BomServiceImpl implements BomService {
    @Autowired
    private BomMapper bomMapper;

    /* select option 제품명 */
    @Override
    public List<BomListDto> getProdNmList() {
        log.info("getProdNmList....." );
        return bomMapper.getProdNmList();
    }

    /* select option 제품규격 */
    @Override
    public List<BomListDto> getProdDivList() {
        log.info("getProdDivList.....");
        return bomMapper.getProdDivList();
    }

    /* select option 재료명 */
    @Override
    public List<BomListDto> getMatNmList() {
        log.info("getProdNmList.....");
        return bomMapper.getMatNmList();
    }

    /* BOM 현황 조회(검색 기능) 서비스 */
    @Override
    public List<BomListDto> getList(CriteriaDto cri) {
        log.info("getList.........");

        return bomMapper.getList(cri);
    }

    /* BOM 수정 서비스 */
    @Override
    public boolean modify(BomModifyDto bomModifyDto) {
        log.info("modify......" + bomModifyDto);
        return bomMapper.update(bomModifyDto) == 1;
        // 정상적인 수정/삭제가 이루어지면 1이라는 값이 반환되므로,
        // '==' 연산자를 이용하여 true/false를 처리할 수 있다.
    }

    /* BOM 삭제 서비스 */
    @Override
    public boolean remove(Long bomId, Long matId) {
        log.info("remove....., bomIds: " + bomId + ", matIds: " + matId);
        BomDeleteDto bomVo = new BomDeleteDto();
        bomVo.setBomId(bomId);
        bomVo.setMatId(matId);
        return bomMapper.delete(bomVo) == 1;
        // 정상적인 수정/삭제가 이루어지면 1이라는 값이 반환되므로,
        // '==' 연산자를 이용하여 true/false를 처리할 수 있다.
    }


    /* BOM 목록 전체 개수 조회 서비스(무한 스크롤에 사용) */
    @Override
    public int getTotalCount(Long listSeq) {
        return bomMapper.getCountByListSeq(listSeq);
    }
    /*@Override
    public int getCurrVal() {
        return bomMapper.readCurrval();
    }*/

    /* BOM 등록 서비스 */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void registerBom(BomInsertDto bomInsertDto) throws Exception {
        log.info("register......" + bomInsertDto);

        // 1. 제품 및 재료 정보가 이미 존재하는지 확인

        // 제품 조회
        BomInsertDto existingProduct = bomMapper.selectProd(bomInsertDto);
        if (existingProduct == null) {
            // 제품이 존재하지 않는 경우, 새로 등록
            bomMapper.insertProd(bomInsertDto);
        }

        // 재료 조회
        BomInsertDto existingMaterial = bomMapper.selectMat(bomInsertDto);
        if(existingMaterial == null) {
            // 재료가 존재하지 않는 경우, 새로 등록
            bomMapper.insertMat(bomInsertDto);
        }

        // 2. 공급 업체 정보 등록
        bomMapper.insertSup(bomInsertDto);

        // 3. LOT_ID 조회 및 등록
        BomInsertDto lotInfo = bomMapper.selectLot(bomInsertDto);
        if(lotInfo == null) {
            // LOT_ID가 존재하지 않는 경우, 새로 등록
            bomMapper.insertLot(bomInsertDto);
        }

        // 4. BOM_ID 조회 및 등록
        BomInsertDto bomInfo = bomMapper.selectBomId(bomInsertDto);
        if(bomInfo != null) {
            // 기존에 BOM_ID가 있는 경우
            bomInsertDto.setBomId(bomInfo.getBomId());
            bomMapper.insertBom1(bomInsertDto);
        } else {
            // 기존에 BOM_ID가 없는 경우
            bomMapper.insertBom2(bomInsertDto);
        }

    }
}
