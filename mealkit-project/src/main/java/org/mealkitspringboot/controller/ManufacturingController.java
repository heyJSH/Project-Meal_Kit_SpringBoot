package org.MealKit.controller;

import lombok.extern.log4j.Log4j;
import org.MealKit.domain.*;
import org.MealKit.service.ManufacturingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

@Log4j
@Controller
public class ManufacturingController {
    @Autowired
    private ManufacturingService manufacturingService;

    @RequestMapping(value = "/manufacturing", method = {RequestMethod.GET, RequestMethod.POST})
    public String manufacturing(
            Model model){
        List<ManufacturingVO> manufacturingVOList = manufacturingService.selectManufacturing();
        List<FinishedProductVO> finishedProductVOList = manufacturingService.selectManuProd();
        model.addAttribute("manufacturingVOList",manufacturingVOList);
        model.addAttribute("finishedProductVOList",finishedProductVOList);
        return "manufacturing";
    }

    @GetMapping("/checkManuId")
    @ResponseBody
    public ResponseEntity<?> checkManuId(
            @RequestParam("emp_id") int empId){
        boolean isValid = manufacturingService.checkManuId(empId);
        return new ResponseEntity<>(Map.of("isValid", isValid), HttpStatus.OK);
    }

    @GetMapping("/moreInfo")
    public ResponseEntity<?> moreInfo(
            @RequestParam("product_id") int productId){
        List<ManuMateVO> manuMateVOList = manufacturingService.selectManuMate(productId);
        if (manuMateVOList != null){
            return new ResponseEntity<>(manuMateVOList, HttpStatus.OK);
        }else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/selectManufacturing")
    public ResponseEntity<?> selectManufacturingData(){
        List<ManufacturingVO> manufacturingVOList = manufacturingService.selectManufacturing();
        return new ResponseEntity<>(manufacturingVOList, HttpStatus.OK);
    }

    @GetMapping("/selectManuProd")
    public ResponseEntity<?> selectManuProd(){
        List<FinishedProductVO> finishedProductVOList = manufacturingService.selectManuProd();
        return new ResponseEntity<>(finishedProductVOList, HttpStatus.OK);
    }

    @RequestMapping(method = {RequestMethod.POST},
            value = "/updateProduct",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    @ResponseBody
    public ResponseEntity<?> updateProduct(
            @RequestBody UpdateProductDTO dto){
        int productId = dto.getProduct_id();
        int lot_id = dto.getLot_id();
        int lotSize = dto.getLot_size();
        int product_quantity = manufacturingService.findProductQuantity(productId);
        int new_quantity = product_quantity + lotSize;
        return manufacturingService.updateManuProd(new_quantity, lot_id) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(method = {RequestMethod.POST},
            value = "/updateInstruction",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    @ResponseBody
    public ResponseEntity<?> updateInstruction(
            @RequestBody UpdateInstructionDTO dto){
        int output = dto.getOutput();
        String manu_date = dto.getManu_date();
        int manu_id = dto.getEmp_id();
        int lot_id = dto.getLot_id();
        return manufacturingService.updateInstruction(output, manu_date, manu_id, lot_id) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(method = {RequestMethod.POST},
            value = "/deleteManufacturing",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    @ResponseBody
    public ResponseEntity<?> deleteManufacturing(
            @RequestBody DeleteManufacturingDTO dto){
        int lot_id = dto.getLot_id();
        return manufacturingService.deleteManufacturing(lot_id) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(method = {RequestMethod.POST},
            value = "/updateMaterial",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    @ResponseBody
    public ResponseEntity<?> updateMaterial(
            @RequestBody UpdateMaterialDTO dto){
        int product_id = dto.getProduct_id();
        int lot_size = dto.getLot_size();
        List<ManuMateVO> manuMateVOList = manufacturingService.selectManuMate(product_id);
        int[] bom_prod_quantity = new int[manuMateVOList.size()];
        int[] material_to_deduct = new int[manuMateVOList.size()];
        int[] material_id = new int[manuMateVOList.size()];
        for(int i = 0; i < manuMateVOList.size(); i++){
            material_id[i] = manuMateVOList.get(i).getMaterial_id();
            bom_prod_quantity[i] = manuMateVOList.get(i).getBom_prod_quantity();
            material_to_deduct[i] = lot_size / 1000 * bom_prod_quantity[i];
            manufacturingService.updateManuMate(material_to_deduct[i], material_id[i]);
        }
        return null;
    }
}
