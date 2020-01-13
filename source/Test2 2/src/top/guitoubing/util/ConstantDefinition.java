package top.guitoubing.util;

public class ConstantDefinition {

    // 添加到session中的attributeName
    public static final String USERSESSION = "LOGIN_USER";
    // 登录界面
    public static final String LOGINPAGE = "/login.jsp";

    // 登录返回结果名称
    public static final String LOGIN_RETURN = "LOGIN_RETURN";
    // 登录后端返回结果
    public static final int LOGIN_SUCCESS = 1;
    public static final int WRONG_PWD = 2;
    public static final int WRONG_USER = 3;
    // 登录前端返回结果
    public static final int WRONG_FORMAT_USER = 4;
    public static final int WRONG_FORMAT_PWD = 5;

    // 注册返回结果名称
    public static final String REGISTER_RETURN = "REGISTER_RETURN";
    // 注册前端返回结果
    public static final int REGISTER_SUCCESS = 1;
    public static final int USER_EXISTS = 2;
    // 注册后端返回结果
    public static final int WRONG_FORMAT_USER_R = 3;
    public static final int PWD_INCONFORMITY = 4;
    public static final int WRONG_FORMAT_PWD_R = 5;

    public static final String DEFAULT_SEARCH = "爱 乐 之";


}
