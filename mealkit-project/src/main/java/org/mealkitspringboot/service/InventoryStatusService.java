package org.MealKit.service;

import org.MealKit.domain.FinishedProductVO;
import org.MealKit.domain.InvenMateVO;
import java.util.List;

public interface InventoryStatusService {
    List<FinishedProductVO> selectInvenProd();

    List<InvenMateVO> selectInvenMate();
}
