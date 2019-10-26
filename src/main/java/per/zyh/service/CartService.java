package per.zyh.service;

import per.zyh.pojo.Cart;
import per.zyh.pojo.CartAndGoods;
import per.zyh.pojo.Goods;

import java.util.List;

/**
 * * author：张永辉; 2019/10/25; 10:34
 */
public interface CartService {

    Integer insertGoods(Integer userId, Integer goodsId,Integer goodsNum);

    Integer queryCartIdByGoodsId(Integer goodsId,Integer userId);

    List<Integer> queryAllGoodsIdByUserId(Integer userId);

    Integer queryGoodsNumByGoodsId(Integer goodsId,Integer userId);

    Integer updateGoodsNumByGoodsId(Integer goodsId, Integer goodsNum,Integer userId);

    Integer deleteGoods(Integer goodsId, Integer userId);

    List<CartAndGoods> queryAll(Integer userId);
}
