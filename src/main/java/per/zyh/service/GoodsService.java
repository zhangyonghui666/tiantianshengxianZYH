package per.zyh.service;

import per.zyh.pojo.Goods;

import java.util.List;

/**
 * * author：张永辉; 2019/10/22; 22:15
 */
public interface GoodsService {
    List<Goods> queryAllGoodsByTypeId(Integer typeId);

    String queryGoodsBannerImgByTypeId(Integer typeId);

    Goods queryGoodsById(Integer id);
}
