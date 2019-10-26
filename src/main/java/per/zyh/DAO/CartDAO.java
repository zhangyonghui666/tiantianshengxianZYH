package per.zyh.DAO;

import org.apache.ibatis.annotations.Param;
import per.zyh.pojo.Cart;
import per.zyh.pojo.CartAndGoods;
import per.zyh.pojo.Goods;

import java.util.List;

/**
 * * author：张永辉; 2019/10/25; 10:28
 */
public interface CartDAO {

     Integer insertGoods(@Param("userId") Integer userId, @Param("goodsId") Integer goodsId, @Param("goodsNum") Integer goodsNum);

     Integer queryCartIdByGoodsId(@Param("goodsId") Integer goodsId,@Param("userId") Integer userId);

     List<Integer> queryAllGoodsIdByUserId(@Param("userId") Integer userId);

     Integer queryGoodsNumByGoodsId(@Param("goodsId") Integer goodsId,@Param("userId") Integer userId);

     Integer updateGoodsNumByGoodsId(@Param("goodsId") Integer goodsId,@Param("goodsNum") Integer goodsNum,@Param("userId") Integer userId);

     Integer deleteGoods(@Param("goodsId") Integer goodsId, @Param("userId") Integer userId);

     List<CartAndGoods> queryAll(@Param("userId") Integer userId);
}
