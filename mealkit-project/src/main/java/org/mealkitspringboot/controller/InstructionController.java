package org.MealKit.controller;

import org.MealKit.domain.FinishedProductVO;
import org.MealKit.domain.InstructionVO;
import org.MealKit.service.InstructionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class InstructionController {
    @Autowired
    private InstructionService instructionService;

    @GetMapping("/instruction")
    public String instruction(
            Model model){
        List<FinishedProductVO> finishedProductVOList = instructionService.selectInstProd();
        List<InstructionVO> instructionVOList = instructionService.selectInstruction();
        model.addAttribute("finishedProductVOList",finishedProductVOList);
        model.addAttribute("instructionVOList",instructionVOList);
        return "instruction";
    }

    @PostMapping("/instruction_btn")
    public String instruction_btn(
            @RequestParam("inst_id") int inst_id,
            @RequestParam("product_id") int product_id,
            @RequestParam("lot_size") int lot_size,
            @RequestParam("inst_date") String inst_date,
            RedirectAttributes rttr){
        int rtn1 = instructionService.insertInstruction(
                inst_id,
                product_id,
                lot_size,
                inst_date);
        int rtn2 = instructionService.insertManufacturing(
                inst_id,
                product_id,
                lot_size,
                inst_date);
        rttr.addFlashAttribute("insertInstruction",rtn1);
        rttr.addFlashAttribute("insertManufacturing",rtn2);
        return "redirect:/instruction";
    }

    @GetMapping("/checkInstId")
    @ResponseBody
    public ResponseEntity<?> checkInstId(
            @RequestParam("emp_id") int empId){
        boolean isValid = instructionService.checkInstId(empId);
        return new ResponseEntity<>(Map.of("isValid", isValid), HttpStatus.OK);
    }

    @GetMapping("/checkProductId")
    @ResponseBody
    public ResponseEntity<?> checkProductId(
            @RequestParam("product_id") int productId){
        boolean isValid = instructionService.checkProductId(productId);
        return new ResponseEntity<>(Map.of("isValid", isValid), HttpStatus.OK);
    }

    @GetMapping("/checkLotSize")
    @ResponseBody
    public ResponseEntity<?> checkLotSize(
            @RequestParam("lot_size") int lotSize){
        boolean isValid = (lotSize % 1000 == 0);
        return new ResponseEntity<>(Map.of("isValid", isValid), HttpStatus.OK);
    }

    @GetMapping("/checkInstDate")
    @ResponseBody
    public ResponseEntity<?> checkInstDate(
            @RequestParam("inst_date") String instDateStr){
        LocalDate instDate = LocalDate.parse(instDateStr, DateTimeFormatter.ISO_LOCAL_DATE);
        LocalDate today = LocalDate.now();
        Map<String, Boolean> response = new HashMap<>();
        response.put("isValid", !instDate.isBefore(today));
        return ResponseEntity.ok(response);
    }
}
