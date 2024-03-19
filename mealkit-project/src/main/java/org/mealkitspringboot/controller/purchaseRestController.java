package org.mealkitspringboot.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.mealkitspringboot.domain.PurchaseVO;
import org.mealkitspringboot.service.purchaseService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/purchase")
@RestController
@Log4j
@AllArgsConstructor
public class purchaseRestController {
    private purchaseService service;

    @DeleteMapping(value = "/{material_Id}", produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> remove(@PathVariable("material_Id") Long material_Id) {

        log.info("remove: " + material_Id);

        return service.materialDelete(material_Id) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }



    @PostMapping(value = "/new",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> create(@RequestBody PurchaseVO vo){

        log.info("Purchase: " +vo);
        int insertCount = service.materialInsert(vo);

        return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // 재료 수정 1단계(재료 선택)
    @PostMapping(value = "/modifyMaterialName",
            produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<PurchaseVO>> modifyMaterialName(){

        return new ResponseEntity<>(service.materialInfoModifyFirst(), HttpStatus.OK);
    }

    @GetMapping(value = "/modifyMaterialElse/{material_Nm}",
            produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<PurchaseVO> modifyMaterialElse(@PathVariable ("material_Nm") String material_Nm){

        PurchaseVO purchaseVO = service.materialInfoModifySecond(material_Nm);

        return new ResponseEntity<>(purchaseVO, HttpStatus.OK);
    }


    @RequestMapping(method = { RequestMethod.PUT,
            RequestMethod.PATCH }, value = "/{material_Id}", consumes = "application/json", produces = {
            MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> modify(
            @RequestBody PurchaseVO vo) {

        return service.materialModifyThird(vo) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @PostMapping(value = "/materialPurchaseSelectSupplier/{material_Nm}",
            produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<PurchaseVO>> materialPurchaseSelectSupplier(@PathVariable ("material_Nm") String material_Nm){

        List<PurchaseVO> purchaseVO = service.materialPurchaseSelectSupplier(material_Nm);

        return new ResponseEntity<>(purchaseVO, HttpStatus.OK);
    }

    @PostMapping(value = "/purchaseMaterial",
//            consumes = "application/json",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> purchaseMaterial(@RequestBody PurchaseVO vo){

        log.info("Purchase: " +vo);
        int insertCount = service.materialPurchase(vo);

        return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}




