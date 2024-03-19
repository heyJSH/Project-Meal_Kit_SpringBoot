package org.MealKit.mapper;

import org.MealKit.domain.FinishedProductVO;
import org.MealKit.domain.InvenMateVO;
import java.util.List;

public interface InventoryStatusMapper {
    List<FinishedProductVO> selectInvenProd();

    List<InvenMateVO> selectInvenMate();
}
