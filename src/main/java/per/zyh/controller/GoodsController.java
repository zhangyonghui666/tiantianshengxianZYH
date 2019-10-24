package per.zyh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.javassist.runtime.Desc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
        List<Goods> allGoods = goodsService.queryAllGoodsByTypeId(typeId);
        for (Goods good : allGoods) {
            System.out.println(allGoods);
        }
        model.addAttribute("allGoods", allGoods);

        // bannerImg：
        String goodsBannerImg = goodsService.queryGoodsBannerImgByTypeId(typeId);
        model.addAttribute("goodsBannerImg", goodsBannerImg);

        // title:
       String title= goodsTypeService.queryGoodsTitleByTypeId(typeId);
        model.addAttribute("title", title);

        // 将类型id存入域中：
        model.addAttribute("typeId", typeId);

        return "Goods";
    }


    @RequestMapping("/toFoot")
    public String toFooter() {
        return "Foot";
    }

    @RequestMapping("/toHead")
    public String toHead() {
        return "Head";
    }


    @RequestMapping("/toList")
    public String toList(@RequestParam(defaultValue = "id",value = "order") String order,Integer typeId,Model model,@RequestParam(required = false,defaultValue ="1",value = "pageNum") Integer pageNum) {

        model.addAttribute("typeId", typeId);
        model.addAttribute("order", order);


        Goods singleGood02=goodsService.queryGoodsById(2);
        Goods singleGood03=goodsService.queryGoodsById(3);
        model.addAttribute("singleGood02", singleGood02);
        model.addAttribute("singleGood03", singleGood03);

        List<Goods> goods;

        System.out.println("!!!!!!!!!!!!!!!!!!!!!!+排序：" + order);
        // 查看指定的排序：
        if (order.equals("price")) {
            // 根据typeId，查询所有的商品：
            // 设置分页：
            PageHelper.startPage(pageNum, 2);  // 当前页的页码，当前页的展示数量；
            PageHelper.orderBy("price desc");   // 默认根据id降序排列；
            goods= goodsService.queryAllGoodsByTypeId(typeId);
            System.out.println(goods.toString());
        }else{
            // 根据typeId，查询所有的商品：
            // 设置分页：
            PageHelper.startPage(pageNum, 2);  // 当前页的页码，当前页的展示数量；
            PageHelper.orderBy("price asc");   // 默认根据id降序排列；
            goods = goodsService.queryAllGoodsByTypeId(typeId);
            System.out.println(goods.toString());
        }
        model.addAttribute("goods", goods);

        // 根据typeId,查询当前商品种类的title:
        String goodsTitle = goodsTypeService.queryGoodsTitleByTypeId(typeId);
        model.addAttribute("goodsTitle", goodsTitle);



        // 创建pageInfo对象：
        PageInfo<Goods> pageInfo = new PageInfo<>(goods);
        model.addAttribute("pageInfo", pageInfo);

        return "List";
    }


    @RequestMapping("/toDetail")
    public String toDetail(Model model,Integer goodsId,Integer typeId) {

        Goods SingleGoods = goodsService.queryGoodsById(goodsId);
        String goodsTypeTitle = goodsTypeService.queryGoodsTitleByTypeId(typeId);

        model.addAttribute("Singlegoods", SingleGoods);
        model.addAttribute("goodsTypeTitle", goodsTypeTitle);

        Goods singleGood02=goodsService.queryGoodsById(2);
        Goods singleGood03=goodsService.queryGoodsById(3);
        model.addAttribute("singleGood02", singleGood02);
        model.addAttribute("singleGood03", singleGood03);

        return "detail";
    }


}
























