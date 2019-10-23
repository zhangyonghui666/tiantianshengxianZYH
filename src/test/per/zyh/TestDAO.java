package per.zyh;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import per.zyh.DAO.GoodsDAO;
import per.zyh.pojo.Goods;

import javax.annotation.Resource;
import java.util.List;

/**
 * * author：张永辉; 2019/10/21; 17:11
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "classpath:applicationContext.xml")
public class TestDAO {


    @Resource
    private GoodsDAO goodsDAO;


    @Test
    public void test() {

/* User user = userDAO.queryUserByName("张三");
        System.out.println(user.getPassword());
        System.out.println( user.getCreateTime());*/
/*
        User user1 = new User(2,"李四", "1234",null, "2333@qq.com", new Date());
        Integer integer = userDAO.insertUser(user1);
        System.out.println( integer);
*/
        List<Goods> goods = goodsDAO.queryAllGoodsByTypeId(1);
        for (Goods good : goods) {
            System.out.println(good);
        }

    }
}
