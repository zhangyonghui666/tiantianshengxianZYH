package per.zyh.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * * author：张永辉; 2019/10/25; 19:54
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartAndGoods {
    private Integer id;
    private Integer userId;
    private Integer goodsId;
    private Integer GoodsNum;

    private String title;
    private String imgPath;
    private String bannerPath;
    private BigDecimal price;
    private String detail;
    private Date createTime;
    private Integer typeId;
}
