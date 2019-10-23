package per.zyh.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

/**
 * * author：张永辉; 2019/10/22; 21:32
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {
    private Integer id;
    private String title;
    private String imgPath;
    private String bannerPath;
    private BigDecimal price;
    private String detail;
    private Date createTime;
    private Integer typeId;
}
