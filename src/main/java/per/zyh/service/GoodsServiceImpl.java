package per.zyh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import per.zyh.DAO.GoodsDAO;
import per.zyh.DAO.GoodsTypeDAO;
import per.zyh.pojo.Goods;

import java.util.List;

/**
 * * author：张永辉; 2019/10/22; 22:16
 */
@Service
@Transactional
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsDAO goodsDAO;

    @Autowired
    private GoodsTypeDAO goodsTypeDAO;

    @Override
    public List<Goods> queryAllGoodsByTypeId(Integer typeId) {

        return goodsDAO.queryAllGoodsByTypeId(typeId);
    }

    @Override
    public String queryGoodsBannerImgByTypeId(Integer typeId) {

        return goodsTypeDAO.queryGoodsBannerImgByTypeId(typeId);
    }

    @Override
    public Goods queryGoodsById(Integer id) {
        Goods singleGood=goodsDAO.queryGoodsById(id);
        return singleGood;
    }

}
