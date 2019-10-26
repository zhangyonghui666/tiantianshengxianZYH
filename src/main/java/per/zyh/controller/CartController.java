package per.zyh.controller;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import per.zyh.pojo.*;
import per.zyh.service.CartService;
import per.zyh.service.GoodsService;
import per.zyh.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * * author：张永辉; 2019/10/25; 10:31
 */
@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private UserService userService;

    @Autowired
    private CartService cartService;

    @Autowired
    private GoodsService goodsService;

    @GetMapping("/toCart")    // 购物车商品展示页面：
    public String queryAllGoodsByUserId(Model model,HttpSession session) {

        // 获取UserId:
        User user = (User) session.getAttribute("user");
        Integer userId = userService.queryIdByUsername(user.getUsername());

        // 查询该用户的所有的商品以及相应的商品信息：
        List<CartAndGoods> allGoods = cartService.queryAll(userId);
        System.out.println(allGoods.toString());
        model.addAttribute("allGoods", allGoods);
        return "cart";  // 返回到购物车页面；
    }

    // 将商品加入到购物车中：   用Ajax异步；
    @PostMapping("/insertGoods")
    @RequiresAuthentication
    public Status insertGoods(Integer goodsId, Integer goodsNum, HttpSession session) {
        Status firstok = new Status("firstok");
        Status addok = new Status("addok");
        User user = (User) session.getAttribute("user");
        Integer userId = userService.queryIdByUsername(user.getUsername());

//        System.out.println("userId~~~~"+userId + "goodsId~~~~" + goodsId + "goodsNum~~~~" + goodsNum);

        // 根据商品的id和用户的id查询数据库中是否有这个商品：
        Integer cartId = cartService.queryCartIdByGoodsId(goodsId,userId);
        if (cartId != null) {   // 如果购物车中已经存在该商品了，则只让商品数量+1即可
            Integer goodsNum2 = cartService.queryGoodsNumByGoodsId(goodsId,userId);
            goodsNum2 += 1;
             cartService.updateGoodsNumByGoodsId(goodsId, goodsNum2,userId);
            return addok;
        }else {  // 如果商品并不在购物车中：则新增：
            Integer integer = cartService.insertGoods(userId, goodsId,goodsNum);
            return firstok;
        }
    }

    // 用户直接修改购物车商品的数量： 参数：goodsId  goodsNum  userId
    @PutMapping("/update")
    @ResponseBody
    public Status updateGoodsNum(@RequestBody Cart cart,HttpSession session) {
        User user = (User) session.getAttribute("user");
        Integer userId = userService.queryIdByUsername(user.getUsername());

        Integer goodsId = cart.getGoodsId();
        Integer goodsNum = cart.getGoodsNum();

//        System.out.println("!!!!!!!!!!!!!!!!!!!!goodsId和goodsNum"+goodsId+"~~~~~~~~~~~"+goodsNum);

        cartService.updateGoodsNumByGoodsId(goodsId, goodsNum,userId);

        Status status = new Status("update");
//        System.out.println( status+"complete~~~~~~~~~~~~~~~~~~~~~~");
        return status;
    }

    // 用户直接删除购物车的某个商品  参数： goodsId userId
    @DeleteMapping("/delete/{goodsId}")
    public Status deleteGoods(@PathVariable Integer goodsId,HttpSession session) {
        User user = (User) session.getAttribute("user");
        Integer userId = userService.queryIdByUsername(user.getUsername());

        System.out.println("!!!!!!!!!!!!!!!!!!!!!" + goodsId + "```" + userId);

        cartService.deleteGoods(goodsId, userId);

        Status status = new Status("deleteok");
        return status;
    }
}
