package per.zyh.session;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListenerAdapter;

public class MySessionListener extends SessionListenerAdapter {
    /**
     * session创建时触发
     *
     * @param session
     */
    @Override
    public void onStart(Session session) {
        System.out.println("session create~~~");
    }

    /**
     * session 停止时触发    subject.logout()  session.stop()
     *
     * @param session
     */
    @Override
    public void onStop(Session session) {
        System.out.println("session stop~~~");
    }

    /**
     * session过期时触发，静默时间查过了过期时间
     *
     * @param session
     */
    @Override
    public void onExpiration(Session session) {
        System.out.println("session expire~~~");
    }
}
