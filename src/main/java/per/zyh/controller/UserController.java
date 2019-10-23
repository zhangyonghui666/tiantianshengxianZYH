package per.zyh.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import per.zyh.pojo.Status;
import per.zyh.pojo.User;
import per.zyh.resolver.R;
import per.zyh.service.UserService;

import javax.servlet.http.HttpSession;

/**
 * * author：张永辉; 2019/10/21; 17:40
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String loginPage() {
        System.out.println( "去登录~");
        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public R login(User user,String checkBox, HttpSession session) throws Exception {

        // 调用令牌进行登录：
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());

            if (checkBox != null) {
                token.setRememberMe(true);
            }
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);

            R r = R.ok("登录成功");   // {"code":0,"msg":"登录成功"}
            return r;
    }

    @GetMapping("/regist")
    public String registPage() {
        System.out.println( "去注册");
        return "register";
    }

    @PostMapping("/regist")
    @ResponseBody
    public Status regist(User user) {
        userService.insertUser(user);
        Status ok = new Status("ok");
        return ok;
    }

    @PostMapping("/isRepeatUsername")
    @ResponseBody
    public Status queryUsername(String username) {
//        System.out.println(username);
        User user = userService.queryUserByName(username);
//        System.out.println(user );
        Status ok = new Status("ok");
        Status no = new Status("no");
        if (user == null) {
            return ok;
        }else {
            return no;
        }
    }

    @ResponseBody
    @PostMapping("/isValicode")
    public Status isValicode(HttpSession session,String codename) {
        System.out.println( codename);
        String captcha = (String) session.getAttribute("captcha");
        if (codename.equals(captcha)) {
            Status code1 = new Status("codeisok");
            return code1;
        }else{
            Status code1 = new Status("codeisno");
            return code1;
        }

    }

    @RequestMapping("/index")
    public String toIndex() {
        return "index";
    }




    // 以下尚未编写：
    @RequestMapping("/userCenter")
    public String userCenter() {  // 用户中心跳转：
        return "user_center_info";
    }


    @RequestMapping("/myCart")
    public String myCart() {  // 我的购物车跳转：
        return "cart";
    }


    @RequestMapping("/myOrder")
    public String myOrder() {  // 我的订单跳转：
        return "user_center_order";
    }




}
