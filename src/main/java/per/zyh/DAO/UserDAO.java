package per.zyh.DAO;

import org.apache.ibatis.annotations.Param;
import per.zyh.pojo.User;

/**
 * * author：张永辉; 2019/10/21; 17:03
 */
public interface UserDAO {
    Integer insertUser(User user);

    User queryUserByName(@Param("username") String username);

    User queryUserByEmail(@Param("email") String email);

    Integer queryIdByUsername(@Param("username") String username);
}
