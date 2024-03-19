ALTER TABLE bom ADD FOREIGN KEY(product_id) REFERENCES FINISHED_PRODUCT(product_id);
ALTER TABLE bom ADD FOREIGN KEY(material_id) REFERENCES material(material_id);
ALTER TABLE bom ADD FOREIGN KEY(lot_id) REFERENCES instruction(lot_id);


/* BOM 목록 수정 */
-- 해당 코드는 작동하지 않음.
UPDATE FINISHED_PRODUCT fp, MATERIAL m, INSTRUCTION i, BOM b
SET  fp.PRODUCT_DIV = '요리',
     fp.PRODUCT_SPEC = '3인',
     m.MATERIAL_CLASSIFICATION = '포장재',
     i.LOT_SIZE = '3000',
     b.BOM_PROD_QUANTITY = '3',
     b.QUANTITY_UNITS = '개'
WHERE  fp.PRODUCT_ID = 300001
	AND m.MATERIAL_ID = 100001
	AND i.LOT_ID = 30
	AND b.BOM_ID = 701
;

-- 해당 코드는 트랜잭션(Transaction) 주의할 것
BEGIN
  UPDATE FINISHED_PRODUCT
  SET PRODUCT_DIV = '요리', PRODUCT_SPEC = '3인'
  WHERE PRODUCT_ID = 300001;

  UPDATE MATERIAL
  SET MATERIAL_CLASSIFICATION = '포장재'
  WHERE MATERIAL_ID = 100001;

  UPDATE INSTRUCTION
  SET LOT_SIZE = '3000'
  WHERE LOT_ID = 30;

  UPDATE BOM
  SET BOM_PROD_QUANTITY = '3', QUANTITY_UNITS = 'EA'
  WHERE BOM_ID = 701
 	AND PRODUCT_ID = 300001
 	AND MATERIAL_ID = 100001
 	AND LOT_ID = 30;

  COMMIT;
END;

-- 아무 조건 없을 때, 전체 BOM_list 조회
/* BOM코드, 제품코드, 제품명, 제품div, 제품spec, lot사이즈, 재료구분, 재료코드, 재료명, 단위, 수량 */
SELECT b.BOM_ID, b.PRODUCT_ID, fp.PRODUCT_NM, fp.PRODUCT_DIV, fp.PRODUCT_SPEC
							, i.LOT_SIZE
							, m.MATERIAL_CLASSIFICATION, b.MATERIAL_ID, m.MATERIAL_NM
							, b.QUANTITY_UNITS, b.BOM_PROD_QUANTITY
						FROM BOM b, FINISHED_PRODUCT fp, MATERIAL m, INSTRUCTION i
						WHERE b.PRODUCT_ID = fp.PRODUCT_ID
							AND b.MATERIAL_ID = m.MATERIAL_ID
							AND b.LOT_ID = i.LOT_ID
;


/* prod_id 조회 => product_nm 김치찌개, product_spec 2인 */
SELECT fp.PRODUCT_ID FROM FINISHED_PRODUCT fp
WHERE fp.PRODUCT_NM = '김치찌개'
	AND fp.PRODUCT_SPEC='2인';

/* 만약 위의 조회결과가 있을 경우, 동일한 제품을 등록한다는 form을 입력하면 실제 insert는 작동하지 않도록 한다. */
/* 만약 위의 조회결과가 없을 경우, 실제로 insert를 한다. */
INSERT INTO FINISHED_PRODUCT(PRODUCT_NM, PRODUCT_DIV, PRODUCT_SPEC, PRODUCT_PRICE)
	VALUES ('갈비탕', '국/탕/찌개', '2인', '9800');

-- Form2에서 입력한 내용
/* 만약, Form2에서 입력한 내용(감자)가 있으면, material 테이블에 insert 하지 않음.
 * 만약, 입력한 내용(감자)가 없으면, material 테이블에 insert 진행함.  */
SELECT m.MATERIAL_ID FROM MATERIAL m WHERE m.MATERIAL_NM = '감자';

-- 재료명, 재료 구분은 material 테이블에 INSERT
-- 재료 수량, 재료 단위는 BOM 테이블에 INSERT
INSERT INTO MATERIAL(MATERIAL_NM, MATERIAL_CLASSIFICATION)
	VALUES ('당면', '재료');


INSERT INTO BOM (MATERIAL_ID, BOM_PROD_QUANTITY, QUANTITY_UNITS)
SELECT m.MATERIAL_NM, 0.5, 'kg'
FROM MATERIAL m
WHERE m.MATERIAL_NM = '김치';


/*INSERT INTO BOM (MATERIAL_ID, BOM_PROD_QUANTITY, QUANTITY_UNITS, PRODUCT_ID)
SELECT
    m.material_id,
    0.3,
    'kg',
    (SELECT fp.product_id FROM FINISHED_PRODUCT fp WHERE fp.product_nm = '김치찌개')
FROM MATERIAL m
WHERE m.MATERIAL_NM = '당면';*/


-- Form1에서 입력한 내용
/* prod_id 조회 => product_nm 갈비탕, product_spec 2인 */
SELECT fp.PRODUCT_ID FROM FINISHED_PRODUCT fp
WHERE fp.PRODUCT_NM = '갈비탕'
	AND fp.PRODUCT_SPEC='2인';

/* 제품명, 제품스펙과 동일한 product_id가 있는 bom_id를 조회 */
-- 만약 이 쿼리문으로 bom_id가 조회되면, 같은 숫자를 bom_id에 insert, 조회에 사용한 product_id를 insert한다.
-- else 시퀀스로 bom_id에 insert, 조회에 사용한 product_id를 insert한다.
SELECT DISTINCT b.BOM_ID FROM BOM b
WHERE b.PRODUCT_ID =
	(
	 SELECT fp.product_id
	 FROM FINISHED_PRODUCT fp
	 WHERE fp.PRODUCT_NM = '김치찌개'
		AND fp.PRODUCT_SPEC='3인'
	);

-- INSTRUCTION 테이블의 LOT_ID를 조회
SELECT i.LOT_ID
FROM INSTRUCTION i
WHERE i.PRODUCT_ID =
	(
	 SELECT fp.product_id
	 FROM FINISHED_PRODUCT fp
	 WHERE fp.PRODUCT_NM = '김치찌개'
		AND fp.PRODUCT_SPEC='1인'
	)
;
-- INSTRUCTION 테이블의 LOT_SIZE를 조회
SELECT i.LOT_SIZE
FROM INSTRUCTION i
WHERE i.PRODUCT_ID =
	(
	 SELECT fp.product_id
	 FROM FINISHED_PRODUCT fp
	 WHERE fp.PRODUCT_NM = '김치찌개'
		AND fp.PRODUCT_SPEC='1인'
	)
;

select * from user_sequences;

-- INSTRUCTION 테이블 INSERT
INSERT INTO INSTRUCTION(lot_id, product_id, lot_size)
	VALUES (seq_instruction.nextval
			,(SELECT fp.PRODUCT_ID FROM FINISHED_PRODUCT fp
						-- 사용자가 입력한 값
				WHERE fp.PRODUCT_NM = '김치찌개'
					AND fp.PRODUCT_SPEC='1인')
			, 1000);

/* lot_size가 1000(입력값)이고, product_id가 같은, 생산일은 가장 최근이고, 수행일은 없는, 그 중에 lot_id가 제일 높은 lot_id를 조회 */
/* 만약, product_id가 같은 것이 있어서 조회가 된다면, 이것을 bom의 lot_id에 insert,
 *
 * else, product_id가 없어서 조회가 안 된다면, 새로운 lot_id와 해당하는 product_id와
 * '1000'의 lot_size를 insctuction 테이블에 insert 후, bom 테이블에 해당하는 lot_id를 insert */
SELECT MAX(i.lot_id) AS LOT_ID
FROM INSTRUCTION i
WHERE i.product_id IN (
    SELECT fp2.product_id FROM FINISHED_PRODUCT fp2 WHERE fp2.product_nm = '김치찌개' AND fp2.product_spec = '3인'
)
AND i.LOT_SIZE = '3000'
AND i.MANU_DATE IS NULL
AND i.INST_DATE = (
    SELECT MAX(i2.INST_DATE)
    FROM INSTRUCTION i2
    WHERE i.PRODUCT_ID = i2.product_id
);

-- 제품 정보 INSERT
INSERT INTO FINISHED_PRODUCT(PRODUCT_NM, PRODUCT_DIV, PRODUCT_SPEC, PRODUCT_PRICE)
	VALUES ('김치찌개', '국/탕/찌개', '1인', '9900')
;

-- MATERIAL_ID 조회
SELECT m.MATERIAL_ID FROM MATERIAL m WHERE m.MATERIAL_NM = '비닐팩';

-- 재료 정보 INSERT
INSERT INTO MATERIAL(MATERIAL_NM, MATERIAL_CLASSIFICATION)
	VALUES ('갈비탕카톤', '포장재')
;


-- 기존에 BOM이 없는 경우(원래 없던 제품이고, 새로 등록할 때.)
INSERT INTO BOM
	(PRODUCT_ID
	, MATERIAL_ID
	, LOT_ID
	, BOM_PROD_QUANTITY
	, QUANTITY_UNITS)
VALUES (
		-- PRODUCT_ID
		(SELECT fp.product_id
				 FROM FINISHED_PRODUCT fp
				 WHERE fp.PRODUCT_NM = '김치찌개'
					AND fp.PRODUCT_SPEC = '1인')
		-- MATERIAL_ID
		, (SELECT m.MATERIAL_ID FROM MATERIAL m WHERE m.MATERIAL_NM = '비닐팩')
		-- LOT_ID
		, (SELECT i.LOT_ID
			FROM INSTRUCTION i
			WHERE i.PRODUCT_ID =
				(
				 SELECT fp.product_id
				 FROM FINISHED_PRODUCT fp
				 WHERE fp.PRODUCT_NM = '김치찌개'
					AND fp.PRODUCT_SPEC = '1인'
				)
		)
		-- BOM_PROD_QUANTITY[(Form2에서 입력된 값) * (해당하는 LOT_SIZE)]
		, 1 * (SELECT i.LOT_SIZE
				FROM INSTRUCTION i
				WHERE i.PRODUCT_ID =
					(
					 SELECT fp.product_id
					 FROM FINISHED_PRODUCT fp
					 WHERE fp.PRODUCT_NM = '김치찌개'
						AND fp.PRODUCT_SPEC='1인'
					)
				)
		-- QUANTITY_UNITS(Form2에서 입력된 값)
		, 'ea'
	)
;

-- 기존에 BOM_ID가 있는 경우(원래 있는 제품이고, 재료만 등록할 때.)
INSERT INTO BOM
	(BOM_ID
	, PRODUCT_ID
	, MATERIAL_ID
	, LOT_ID
	, BOM_PROD_QUANTITY
	, QUANTITY_UNITS
	)
VALUES (
	-- BOM_ID(만약 조회된 값이 있으면, 그 값을 insert, 없으면 빈 값으로 둘 것.)
	(SELECT DISTINCT b.BOM_ID
		FROM BOM b
		WHERE b.PRODUCT_ID =
			(
			 SELECT fp.product_id
			 FROM FINISHED_PRODUCT fp
			 WHERE fp.PRODUCT_NM = '김치찌개'
				AND fp.PRODUCT_SPEC = '1인'
			)
	)
	-- PRODUCT_ID
	, (SELECT fp.product_id
			 FROM FINISHED_PRODUCT fp
			 WHERE fp.PRODUCT_NM = '김치찌개'
				AND fp.PRODUCT_SPEC = '1인')
	-- MATERIAL_ID
	, (SELECT m.MATERIAL_ID FROM MATERIAL m WHERE m.MATERIAL_NM = '김치찌개카톤')
	-- LOT_ID
	, (SELECT i.LOT_ID
		FROM INSTRUCTION i
		WHERE i.PRODUCT_ID =
			(
			 SELECT fp.product_id
			 FROM FINISHED_PRODUCT fp
			 WHERE fp.PRODUCT_NM = '김치찌개'
				AND fp.PRODUCT_SPEC = '1인'
			)
	)
	-- BOM_PROD_QUANTITY[(Form2에서 입력된 값) * (해당하는 LOT_SIZE)]
	, 1 * (SELECT i.LOT_SIZE
			FROM INSTRUCTION i
			WHERE i.PRODUCT_ID =
				(
				 SELECT fp.product_id
				 FROM FINISHED_PRODUCT fp
				 WHERE fp.PRODUCT_NM = '김치찌개'
					AND fp.PRODUCT_SPEC='1인'
				)
			)
	-- QUANTITY_UNITS(Form2에서 입력된 값)
	, 'ea'

)
;

-- SUPPLIER 테이블에 INSERT
INSERT INTO SUPPLIER
	(
	SUP_NAME
	, PHONE_NUM
	, SUP_ADDRESS
	, SUP_EMAIL
	, SUP_SELL)
VALUES (
	'포장킹'
	, '010-0000-0002'
	, '경기도 화성시 xx로 포장킹빌딩'
	, 'pojang@king.co.kr'
	, '비닐팩, 김치찌개카톤'
	)
;



