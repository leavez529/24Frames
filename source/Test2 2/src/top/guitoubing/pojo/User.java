package top.guitoubing.pojo;

import java.math.BigDecimal;

public class User {
    private BigDecimal id;

    private String username;

    private String password;

    private String gender;

    private BigDecimal fans;

    private BigDecimal subscribe;

    private String intro;

    private String avator;

    private String tel;

    public User(BigDecimal id, String username, String password, String gender, BigDecimal fans, BigDecimal subscribe, String intro, String avator, String tel) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.fans = fans;
        this.subscribe = subscribe;
        this.intro = intro;
        this.avator = avator;
        this.tel = tel;
    }

    public User() {
        super();
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public BigDecimal getFans() {
        return fans;
    }

    public void setFans(BigDecimal fans) {
        this.fans = fans;
    }

    public BigDecimal getSubscribe() {
        return subscribe;
    }

    public void setSubscribe(BigDecimal subscribe) {
        this.subscribe = subscribe;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
    }

    public String getAvator() {
        return avator;
    }

    public void setAvator(String avator) {
        this.avator = avator == null ? null : avator.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }
}