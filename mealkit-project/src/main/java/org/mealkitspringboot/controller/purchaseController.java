package org.mealkitspringboot.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.mealkitspringboot.domain.PurchaseVO;
import org.mealkitspringboot.service.purchaseService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Log4j
@RequestMapping("/purchase")
@AllArgsConstructor
public class purchaseController {
    private purchaseService service;

    // 재고 화면 재료정보 select
    @GetMapping("/materialinventory")
    public String materialinventory(PurchaseVO purchaseVO, Model model){
        List<PurchaseVO> materialInventory = service.materialInventory();
        model.addAttribute("materialInventory", materialInventory);

        return "material/materialInventory";
    }

    // 구매 화면 재료이름 select
    @GetMapping("/purchaseMaterial")
    public String materialPurchaseSelectMaterial(PurchaseVO purchaseVO, Model model){
        List<PurchaseVO> materialPurchaseSelectMaterial = service.materialInventory();
        model.addAttribute("materialPurchase", materialPurchaseSelectMaterial);

        return "purchase/purchaseMaterial";
    }



}