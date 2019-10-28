package per.zyh.cache;

import org.apache.ibatis.cache.Cache;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.web.context.ContextLoader;

import java.util.Set;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * * author：张永辉; 2019/10/15; 18:50
 */

/**
 * todo：该类的作用：在mybatis完成查询之后，将数据缓存起来；当再次查询数据时将先检查缓存，极大提升了查询速度；
 */
// 注意：这里做的是MyBatis的缓存，所以实现的是ibatis的Cache;
public class MyCache implements Cache {

    // 当前的Mapper（即xxxDAO.xml）中的namespace，即命名空间；
    private String id;

    // 定义一个可重用锁，保证线程安全；
    private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock();

    // 这是Spring_Redis框架的一个核心类，它主要是用来帮助Java和redis进行通信的，它提供了许多方法；
    // 在这里把它作为了一个全局的变量，后面的方法中都是用的这个；
    RedisTemplate<String, Object> template;

    public MyCache() {
    }

    // 该带参构造方法的作用：MyBatis为一个Mapper创建缓存对象时，会调用该构造方法，从而将Mapper的namespace命名空间（即，id）传过去
    public MyCache(String id) {
        this.id = id;
    }

// 以上是自定义内容；

    @Override
    public String getId() {
        return this.id;
    }

    /**
     * todo：该方法的作用：当执行查询操作时，将查询结果进行缓存；
     *
     * @param key：此次查询的标识，其中包含有sql语句（String形式）
     * @param value：此次查询到的结果数据；这里是：User        List<User>
     */
    @Override
    public void putObject(Object key, Object value) {
        System.out.println("进行缓存的数据：" + key + "：" + value);

        // 将查询到的结果，存入到redis，也就是给缓存起来了；
        template.opsForValue().set(key.toString(), value);
    }

    @Override
    public Object getObject(Object key) {
        // 第一步：先从Redis配置文件（也隶属于Spring配置文件）中，获取到Redis的核心组件/类：RedisTemplate
        template = (RedisTemplate) ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate");

        // 第二步：检查缓存中是否有想要查找的key：
        System.out.println("检查缓存,key：" + key.getClass());

        // 第三步：根据key从redis中获取到数据，即从缓存中获取到结果数据。
        // 注意：（key中包含sql语句，其内部是通过sql语句的形式来从redis中检查是否有相对应的缓存数据可用）：
        Object cache = template.opsForValue().get(key.toString());

        // 最后：返回结果：
        if (cache != null) {
            return cache;   // 将查询到的缓存数据结果，返回出去；
        } else {
            System.out.println("检查缓存，但未命中");
            return null;
        }
    }

    @Override
    public Object removeObject(Object key) {
        template = (RedisTemplate) ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate");
        template.delete(key.toString());
        return null;
    }

    @Override
    public void clear() {
        System.out.println("namespace:" + this.getId() + " 发生了写操作，清空所有相关缓存数据");
        template = (RedisTemplate) ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate");
        // 获取当前mapper下的所有缓存key
        Set<String> keys = template.keys("*" + this.getId() + "*");
        // 删除这些key
        template.delete(keys);

    }

    @Override
    public int getSize() {
        return 0;
    }

    @Override
    public ReadWriteLock getReadWriteLock() {
        return this.readWriteLock;
    }

}
