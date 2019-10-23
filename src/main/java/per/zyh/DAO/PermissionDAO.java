package per.zyh.DAO;

import java.util.Set;

/**
 * * author：张永辉; 2019/10/9; 21:30
 * *
 * <p>
 * **************************************************************************
 */
public interface PermissionDAO {
    //  因为自定义的Realm里边的SimpleAuthorizationInfo();这里的参数的要求是Set集合，所以这里用Set类型
    public Set<String> queryAllPermissionByUsername(String username);
}
