package per.zyh.DAO;

import per.zyh.pojo.GoodsType;

import java.util.List;

/**
 * * author：张永辉; 2019/10/22; 21:34
 */
public interface GoodsTypeDAO {
    List<GoodsType> queryAllGoodsType();



    String queryGoodsBannerImgByTypeId(Integer typeId);
}
