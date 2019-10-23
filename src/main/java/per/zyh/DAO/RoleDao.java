package per.zyh.DAO;

import org.apache.ibatis.annotations.Param;

import java.util.Set;

/**
 * * author：张永辉; 2019/10/9; 21:36
 * *
 * <p>
 * **************************************************************************
 */
public interface RoleDao {
    public Set<String> queryAllRolenameByUsername(@Param("username") String username);
}
