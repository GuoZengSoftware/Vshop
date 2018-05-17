package com.ygz.vshop.enity;

/**
 * 系统设置信息实体类
 * Created by Ygz on 2017/5/17.
 */
public class System
{
    //自动增长id
    private int system_id;
    //会员级别A级、B级、C级
    private int system_level;
    //最小人数
    private int system_min;
    //最大人数
    private int system_max;
    //系统奖金
    private float system_money;
    //创建时间(时间戳)
    private long system_createdate;
    //创建人
    private String system_person;

    public int getSystem_id() {
        return system_id;
    }

    public void setSystem_id(int system_id) {
        this.system_id = system_id;
    }

    public int getSystem_level() {
        return system_level;
    }

    public void setSystem_level(int system_level) {
        this.system_level = system_level;
    }

    public int getSystem_min() {
        return system_min;
    }

    public void setSystem_min(int system_min) {
        this.system_min = system_min;
    }

    public int getSystem_max() {
        return system_max;
    }

    public void setSystem_max(int system_max) {
        this.system_max = system_max;
    }

    public float getSystem_money() {
        return system_money;
    }

    public void setSystem_money(float system_money) {
        this.system_money = system_money;
    }

    public long getSystem_createdate() {
        return system_createdate;
    }

    public void setSystem_createdate(long system_createdate) {
        this.system_createdate = system_createdate;
    }

    public String getSystem_person() {
        return system_person;
    }

    public void setSystem_person(String system_person) {
        this.system_person = system_person;
    }

    public System()
    {

    }

}
