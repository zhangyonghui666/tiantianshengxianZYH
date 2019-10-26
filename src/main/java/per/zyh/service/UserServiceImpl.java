package per.zyh.service;

import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import per.zyh.DAO.UserDAO;
import per.zyh.constant.MyConstant;
import per.zyh.pojo.User;

import java.util.Date;
import java.util.UUID;

/**
 * * author：张永辉; 2019/10/21; 17:37
 */
@Transactional
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public Integer insertUser(User user) {
        // 加密：

        // 设置盐：
        String salt = UUID.randomUUID().toString();

        String password = new Sha256Hash(user.getPassword(), salt, MyConstant.INTERCOUNT).toBase64();

        System.out.println(user.getPassword()+"bgfdsn"+salt);

        user.setSalt(salt);
        user.setPassword(password);
        user.setCreateTime(new Date());
        Integer integer = userDAO.insertUser(user);
        return integer;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public User queryUserByName(String username) {
        User user = userDAO.queryUserByName(username);
        return user;
    }

    @Override
    public User queryUserByEmail(String email) {
        return userDAO.queryUserByEmail(email);
    }

    @Override
    public Integer queryIdByUsername(String username) {
        return userDAO.queryIdByUsername(username);
    }

}
