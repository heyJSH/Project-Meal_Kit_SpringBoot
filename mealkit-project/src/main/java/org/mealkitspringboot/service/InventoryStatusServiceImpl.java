package org.MealKit.service;

import lombok.extern.log4j.Log4j;
import org.MealKit.domain.FinishedProductVO;
import org.MealKit.domain.InvenMateVO;
import org.MealKit.mapper.InventoryStatusMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Log4j
@Service
public class InventoryStatusServiceImpl implements InventoryStatusService{
    @Autowired
    private InventoryStatusMapper invenMapper;
    @Override
    public List<FinishedProductVO> selectInvenProd() {
        List<FinishedProductVO> finishedProductVOList = invenMapper.selectInvenProd();
        return finishedProductVOList;
    }

    @Override
    public List<InvenMateVO> selectInvenMate() {
        List<InvenMateVO> invenMateVOList = invenMapper.selectInvenMate();
        return invenMateVOList;
    }
}
