package per.zyh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import per.zyh.pojo.Goods;
import per.zyh.pojo.GoodsType;
import per.zyh.service.GoodsService;
import per.zyh.service.GoodsTypeService;

import java.util.List;

/**
 * * author：张永辉; 2019/10/22; 22:06
 */
@Controller
@RequestMapping("/goodsController")
public class GoodsController {
    @Autowired
    private GoodsTypeService goodsTypeService;
    @Autowired
    private GoodsService goodsService;

    @GetMapping("/GoodsType")
    public String queryAllGoodsType(Model model) {
        List<GoodsType> goodsTypes = goodsTypeService.queryAllGoodsType();
        for (GoodsType goodsType : goodsTypes) {
            System.out.println(goodsType);
        }
        model.addAttribute("goodsTypes",goodsTypes);
        return "GoodsType";
    }

    @GetMapping("/Goods")
    public String queryAllGoodsByTypeId(Model model,Integer typeId) {

        // allGoods：
        List<Goods> goods = goodsService.queryAllGoodsByTypeId(typeId);
        for (Goods good : goods) {
            System.out.println(goods);
        }
        model.addAttribute("goods", goods);

        // bannerImg：
        String goodsBannerImg = goodsService.queryGoodsBannerImgByTypeId(typeId);
        model.addAttribute("goodsBannerImg", goodsBannerImg);

        // title:
       String title= goodsTypeService.queryGoodsTitleByTypeId(typeId);
        model.addAttribute("title", title);

        return "Goods";
    }

}
