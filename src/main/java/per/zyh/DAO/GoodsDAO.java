package per.zyh.DAO;

import per.zyh.pojo.Goods;

import java.util.List;

/**
 * * author：张永辉; 2019/10/22; 21:50
 */
public interface GoodsDAO {
    List<Goods> queryAllGoodsByTypeId(Integer typeId);


    String queryGoodsTitleByTypeId(Integer typeId);
}
