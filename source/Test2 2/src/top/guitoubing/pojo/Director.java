package top.guitoubing.pojo;

import java.math.BigDecimal;

public class Director {
    private BigDecimal id;

    private String name;

    private String gender;

    private String birthday;

    private String starsigh;

    private BigDecimal region;

    public Director(BigDecimal id, String name, String gender, String birthday, String starsigh, BigDecimal region) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.birthday = birthday;
        this.starsigh = starsigh;
        this.region = region;
    }

    public Director() {
        super();
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday == null ? null : birthday.trim();
    }

    public String getStarsigh() {
        return starsigh;
    }

    public void setStarsigh(String starsigh) {
        this.starsigh = starsigh == null ? null : starsigh.trim();
    }

    public BigDecimal getRegion() {
        return region;
    }

    public void setRegion(BigDecimal region) {
        this.region = region;
    }
}