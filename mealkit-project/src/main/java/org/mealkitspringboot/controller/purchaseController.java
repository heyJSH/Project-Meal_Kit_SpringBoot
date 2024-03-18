package org.mealkitspringboot.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.mealkitspringboot.domain.PurchaseVO;
import org.mealkitspringboot.service.purchaseService;

import java.util.List;

@Controller
@Log4j
@RequestMapping("/purchase")
@AllArgsConstructor
public class purchaseController {
    private purchaseService Service;

    @GetMapping("/modifyMaterial")
    public String list(PurchaseVO purchaseVO, Model model) {
        log.info("modifyMaterial");

        List<PurchaseVO> modifyList = Service.modifymaterialservice();
        log.info("111111111111111111111111111111111111" + modifyList);
        model.addAttribute("modifyList", modifyList);

        return "test1";
    }
}
