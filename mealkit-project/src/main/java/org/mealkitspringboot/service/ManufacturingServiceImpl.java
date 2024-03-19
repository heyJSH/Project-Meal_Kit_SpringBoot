package org.MealKit.service;

import lombok.extern.log4j.Log4j;
import org.MealKit.domain.*;
import org.MealKit.mapper.ManufacturingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Log4j
@Service
public class ManufacturingServiceImpl implements ManufacturingService{
    @Autowired
    private ManufacturingMapper manufacturingMapper;

    @Override
    public List<ManufacturingVO> selectManufacturing() {
        List<ManufacturingVO> manufacturingVOList = manufacturingMapper.selectManufacturing();
        return manufacturingVOList;
    }

    @Override
    public List<FinishedProductVO> selectManuProd() {
        List<FinishedProductVO> finishedProductVOList = manufacturingMapper.selectManuProd();
        return finishedProductVOList;
    }

    @Override
    public List<ManuMateVO> selectManuMate(int product_id) {
        List<ManuMateVO> manuMateVOList = manufacturingMapper.selectManuMate(product_id);
        return manuMateVOList;
    }

    @Override
    public int updateManuProd(int new_quantity, int lot_id) {
        int rtn = manufacturingMapper.updateManuProd(new_quantity, lot_id);
        return rtn;
    }

    @Override
    public int updateManuMate(int material_to_deduct, int material_id) {
        ManuMateVO manuMateVO = new ManuMateVO();
        manuMateVO.setMaterial_to_deduct(material_to_deduct);
        manuMateVO.setMaterial_id(material_id);
        int rtn = manufacturingMapper.updateManuMate(manuMateVO);
        return rtn;
    }

    @Override
    public int updateInstruction(int output, String manu_date, int manu_id, int lot_id) {
        InstructionVO instructionVO = new InstructionVO();
        instructionVO.setOutput(output);
        instructionVO.setManu_date(manu_date);
        instructionVO.setManu_id(manu_id);
        instructionVO.setLot_id(lot_id);
        int rtn = manufacturingMapper.updateInstruction(instructionVO);
        return rtn;
    }

    @Override
    public int deleteManufacturing(int lot_id) {
        return manufacturingMapper.deleteManufacturing(lot_id);
    }

    @Override
    public boolean checkManuId(int empId){
        return manufacturingMapper.findEmployeeById(empId) != null;
    }

    @Override
    public int findProductQuantity(int productId) {
        return manufacturingMapper.findProductQuantity(productId).getProduct_quantity();
    }
}
