package per.zyh.service;

import org.apache.ibatis.annotations.Param;

import java.util.Set;

/**
 * * author：张永辉; 2019/10/9; 21:49
 * *
 * <p>
 * **************************************************************************
 */
public interface RoleService {
    public Set<String> queryAllRolenameByUsername(@Param("username") String username);
}
