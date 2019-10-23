package per.zyh.service;

import per.zyh.pojo.GoodsType;

import java.util.List;

/**
 * * author：张永辉; 2019/10/22; 22:10
 */
public interface GoodsTypeService {
    List<GoodsType> queryAllGoodsType();

    String queryGoodsTitleByTypeId(Integer typeId);

}
