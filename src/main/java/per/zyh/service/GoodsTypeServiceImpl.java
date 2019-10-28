package per.zyh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import per.zyh.DAO.GoodsDAO;
import per.zyh.DAO.GoodsTypeDAO;
import per.zyh.pojo.GoodsType;

import java.util.List;

/**
 * * author：张永辉; 2019/10/22; 22:12
 */
@Transactional
@Service
public class GoodsTypeServiceImpl implements GoodsTypeService {

    @Autowired
    private GoodsTypeDAO goodsTypeDAO;

    @Autowired
    private GoodsDAO goodsDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<GoodsType> queryAllGoodsType() {
        List<GoodsType> goodsTypes = goodsTypeDAO.queryAllGoodsType();
        return goodsTypes;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public String queryGoodsTitleByTypeId(Integer typeId) {
        return goodsDAO.queryGoodsTitleByTypeId(typeId);
    }
}
