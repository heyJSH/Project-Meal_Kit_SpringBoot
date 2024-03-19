package org.mealkitspringboot.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/*검색을 위한 클래스 VO*/
@Getter
@Setter
public class CriteriaDto {
    private String prodNm;        // 제품명 검색 조건(JSP의 EL(ExpressionLanguage)을 적절하게 매칭할 것)
    private String prodDiv;
    private String matNm;
    private List<String> keywords;

   /* // 기본 생성자 추가
    public CriteriaVo() {
        this.keywords = new ArrayList<>();
    }

    // 제품명, 제품 규격, 재료명(option value값들)
    // prodNm, prodDiv, matNm
    public String[] getKeywordsArr() {
        if (keywords == null || keywords.isEmpty()) {
            return new String[]{};
        } else {
            return keywords.toArray(new String[keywords.size()]);
        }
    }*/

    /* BOM 검색 옵션 */
    public CriteriaDto(String prodNm, String prodDiv, String matNm) {
        this.prodNm = prodNm;
        this.prodDiv = prodDiv;
        this.matNm = matNm;
    }
}
