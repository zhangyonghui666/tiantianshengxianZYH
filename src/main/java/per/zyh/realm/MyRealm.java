package per.zyh.realm;

import lombok.Getter;
import lombok.Setter;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import per.zyh.pojo.User;
import per.zyh.service.PermissionService;
import per.zyh.service.RoleService;
import per.zyh.service.UserService;

import java.util.Set;

/**
 * * author：张永辉; 2019/10/21; 17:51
 */
@Setter
@Getter
public class MyRealm extends AuthorizingRealm {
    private UserService userService;
    private RoleService roleService;
    private PermissionService permissionService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) throws AuthorizationException {
        // 获取用户名：
        String username = (String) principals.getPrimaryPrincipal();
        // 根据service层向数据库查询角色和权限：
        Set<String> role = roleService.queryAllRolenameByUsername(username);
        Set<String> permission = permissionService.queryAllPermissionByUsername(username);

        // 封装：
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo(role);
        simpleAuthorizationInfo.setStringPermissions(permission);

        return simpleAuthorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        // 获取用户名：
        String  principal = (String) token.getPrincipal();
        // 根据组件查询数据库：
        User user = userService.queryUserByName(principal);
        if (user != null) {  // 说明存在该用户
            // 封装：
            SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), ByteSource.Util.bytes(user.getSalt()), this.getName());
            return simpleAuthenticationInfo;
        } else {
            return null;
        }
    }
}
