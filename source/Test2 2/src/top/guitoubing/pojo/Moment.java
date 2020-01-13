package top.guitoubing.pojo;

import java.math.BigDecimal;

public class Moment {
    private BigDecimal id;

    private String content;

    private BigDecimal userId;

    private String like;

    public Moment(BigDecimal id, String content, BigDecimal userId, String like) {
        this.id = id;
        this.content = content;
        this.userId = userId;
        this.like = like;
    }

    public Moment() {
        super();
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public BigDecimal getUserId() {
        return userId;
    }

    public void setUserId(BigDecimal userId) {
        this.userId = userId;
    }

    public String getLike() {
        return like;
    }

    public void setLike(String like) {
        this.like = like == null ? null : like.trim();
    }
}