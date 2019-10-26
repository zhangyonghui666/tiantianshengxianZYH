package per.zyh.service;

import org.apache.ibatis.annotations.Param;
import per.zyh.pojo.User;

/**
 * * author：张永辉; 2019/10/21; 17:37
 */
public interface UserService {
    Integer insertUser(User user);

    User queryUserByName(@Param("username") String username);

    User queryUserByEmail(String email);

    Integer queryIdByUsername(@Param("username") String username);
}
