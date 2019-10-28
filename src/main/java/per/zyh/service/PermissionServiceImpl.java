package per.zyh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import per.zyh.DAO.PermissionDAO;

import java.util.Set;

@Service
@Transactional
public class PermissionServiceImpl implements PermissionService{

    @Autowired
    private PermissionDAO permissionDAO;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Set<String> queryAllPermissionByUsername(String username) {
        return permissionDAO.queryAllPermissionByUsername(username);
    }
}
