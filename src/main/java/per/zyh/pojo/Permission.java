package per.zyh.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * * author：张永辉; 2019/10/9; 21:26
 * *
 * <p>
 * **************************************************************************
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Permission {
    private Integer id;
    private String permissionName;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
}
