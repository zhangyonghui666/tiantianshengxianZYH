package per.zyh.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * * author：张永辉; 2019/10/22; 21:31
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsType {
    private Integer id;
    private String title;
    private String className;
    private String bannerImgPath;
    private Date createTime;
}
