package top.guitoubing.pojo;

import java.math.BigDecimal;

public class Comment {
    private BigDecimal id;

    private String content;

    private BigDecimal momentId;

    private BigDecimal userId;

    public Comment(BigDecimal id, String content, BigDecimal momentId, BigDecimal userId) {
        this.id = id;
        this.content = content;
        this.momentId = momentId;
        this.userId = userId;
    }

    public Comment() {
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

    public BigDecimal getMomentId() {
        return momentId;
    }

    public void setMomentId(BigDecimal momentId) {
        this.momentId = momentId;
    }

    public BigDecimal getUserId() {
        return userId;
    }

    public void setUserId(BigDecimal userId) {
        this.userId = userId;
    }
}