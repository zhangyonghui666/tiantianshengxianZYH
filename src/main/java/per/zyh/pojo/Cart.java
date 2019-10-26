package per.zyh.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * * author：张永辉; 2019/10/25; 10:27
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private Integer id;
    private Integer userId;
    private Integer goodsId;
    private Integer GoodsNum;
}
