package com.ygz.vshop.enity;

/**
 * 用户信息实体类
 * Created by Ygz on 2017/5/17.
 */
public class User {
    //主键自增
    private int user_id;
    //账号
    private String user_account;
    //密码(MD5加密)
    private String user_password;
    //树形结构图层级数
    private int user_level;
    //左测的值
    private int user_left;
    //右侧的值
    private int user_right;
    //真实姓名
    private String user_name;
    //出生年月
    private String user_birth;
    //电话
    private String user_phone;
    //城市
    private String user_city;
    //问题
    private String user_matter;
    //答案
    private String user_answer;
    //推荐人
    private String user_recommend;
    //创建时间
    private long user_date;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_account() {
        return user_account;
    }

    public void setUser_account(String user_account) {
        this.user_account = user_account;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public int getUser_level() {
        return user_level;
    }

    public void setUser_level(int user_level) {
        this.user_level = user_level;
    }

    public int getUser_left() {
        return user_left;
    }

    public void setUser_left(int user_left) {
        this.user_left = user_left;
    }

    public int getUser_right() {
        return user_right;
    }

    public void setUser_right(int user_right) {
        this.user_right = user_right;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_birth() {
        return user_birth;
    }

    public void setUser_birth(String user_birth) {
        this.user_birth = user_birth;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getUser_city() {
        return user_city;
    }

    public void setUser_city(String user_city) {
        this.user_city = user_city;
    }

    public String getUser_matter() {
        return user_matter;
    }

    public void setUser_matter(String user_matter) {
        this.user_matter = user_matter;
    }

    public String getUser_answer() {
        return user_answer;
    }

    public void setUser_answer(String user_answer)
    {
        this.user_answer = user_answer;
    }

    public String getUser_recommend()
    {
        return user_recommend;
    }

    public void setUser_recommend(String user_recommend)
    {
        this.user_recommend = user_recommend;
    }

    public long getUser_date()
    {
        return user_date;
    }

    public void setUser_date(long user_date)
    {
        this.user_date = user_date;
    }

    public User() {

    }
}
