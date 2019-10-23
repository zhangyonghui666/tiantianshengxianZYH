package per.zyh.service;

import org.springframework.context.annotation.Role;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import per.zyh.DAO.RoleDao;

import javax.annotation.Resource;
import java.util.Set;

/**
 * * author：张永辉; 2019/10/9; 21:49
 * *
 * <p>
 * **************************************************************************
 */
@Service  // 记得xxxService上边到打上@Service注解！
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleDao roleDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Set<String> queryAllRolenameByUsername(String username) {
        return roleDao.queryAllRolenameByUsername(username);
    }
}
