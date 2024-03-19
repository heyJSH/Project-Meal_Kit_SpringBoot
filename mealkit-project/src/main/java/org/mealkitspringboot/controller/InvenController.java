package org.MealKit.controller;

import lombok.extern.log4j.Log4j;
import org.MealKit.domain.FinishedProductVO;
import org.MealKit.domain.InvenMateVO;
import org.MealKit.service.InventoryStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

@Controller
@Log4j
public class InvenController {
    @Autowired
    private InventoryStatusService inventoryStatusService;

    @GetMapping("/inventoryStatus")
    public String inventoryStatus(
            Model model) {
        List<FinishedProductVO> finishedProductVOList = inventoryStatusService.selectInvenProd();
        List<InvenMateVO> invenMateVOList = inventoryStatusService.selectInvenMate();
        model.addAttribute("finishedProductVOList",finishedProductVOList);
        model.addAttribute("invenMateVOList",invenMateVOList);
        return "inventoryStatus";
    }
}
