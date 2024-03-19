package org.mealkitspringboot.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BomListDto {
	private Long listSeq;
	private Long bomId;
	private Long prodId;
	private String prodNm;
	private String prodDiv;
	private String prodSpec;
	private Long prodPrice;
	private Long lotId;
	private Long lotSize;
	private String matDiv;
	private Long matId;
	private String matNm;
	private String quantityUnits;
	private Long bomProdQuantity;

}
