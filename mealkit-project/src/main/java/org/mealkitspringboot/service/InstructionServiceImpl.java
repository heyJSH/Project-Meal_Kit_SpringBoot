package org.MealKit.service;

import lombok.extern.log4j.Log4j;
import org.MealKit.domain.*;
import org.MealKit.mapper.InstructionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Log4j
@Service
public class InstructionServiceImpl implements InstructionService{
    @Autowired
    private InstructionMapper instructionMapper;

    @Override
    public List<FinishedProductVO> selectInstProd() {
        List<FinishedProductVO> finishedProductVOList = instructionMapper.selectInstProd();
        return finishedProductVOList;
    }

    @Override
    public List<InstructionVO> selectInstruction() {
        List<InstructionVO> instructionVOList = instructionMapper.selectInstruction();
        return instructionVOList;
    }

    @Override
    public int insertInstruction(int inst_id, int product_id, int lot_size, String inst_date) {
        InstructionVO instructionVO = new InstructionVO();
        instructionVO.setInst_id(inst_id);
        instructionVO.setProduct_id(product_id);
        instructionVO.setLot_size(lot_size);
        instructionVO.setInst_date(inst_date);
        int rtn = instructionMapper.insertInstruction(instructionVO);
        return rtn;
    }

    @Override
    public int insertManufacturing(int inst_id, int product_id, int lot_size, String inst_date) {
        ManufacturingVO manufacturingVO = new ManufacturingVO();
        manufacturingVO.setInst_id(inst_id);
        manufacturingVO.setProduct_id(product_id);
        manufacturingVO.setLot_size(lot_size);
        manufacturingVO.setInst_date(inst_date);
        int rtn = instructionMapper.insertManufacturing(manufacturingVO);
        return rtn;
    }

    @Override
    public boolean checkInstId(int empId){
        return instructionMapper.findEmployeeById(empId) != null;
    }

    @Override
    public boolean checkProductId(int productId){
        return instructionMapper.findProductById(productId) != null;
    }
}
