package top.guitoubing.pojo;

import java.math.BigDecimal;

public class Tag {
    private BigDecimal id;

    private String name;

    private BigDecimal coverPic;

    private BigDecimal backgroudPic;

    private BigDecimal creator;

    private BigDecimal love;

    private String intro;

    public Tag(BigDecimal id, String name, BigDecimal coverPic, BigDecimal backgroudPic, BigDecimal creator, BigDecimal love, String intro) {
        this.id = id;
        this.name = name;
        this.coverPic = coverPic;
        this.backgroudPic = backgroudPic;
        this.creator = creator;
        this.love = love;
        this.intro = intro;
    }

    public Tag() {
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

    public BigDecimal getCoverPic() {
        return coverPic;
    }

    public void setCoverPic(BigDecimal coverPic) {
        this.coverPic = coverPic;
    }

    public BigDecimal getBackgroudPic() {
        return backgroudPic;
    }

    public void setBackgroudPic(BigDecimal backgroudPic) {
        this.backgroudPic = backgroudPic;
    }

    public BigDecimal getCreator() {
        return creator;
    }

    public void setCreator(BigDecimal creator) {
        this.creator = creator;
    }

    public BigDecimal getLove() {
        return love;
    }

    public void setLove(BigDecimal love) {
        this.love = love;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
    }
}