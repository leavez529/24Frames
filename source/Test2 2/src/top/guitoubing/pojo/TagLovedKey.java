package top.guitoubing.pojo;

import java.math.BigDecimal;

public class TagLovedKey {
    private BigDecimal tagId;

    private BigDecimal userId;

    public TagLovedKey(BigDecimal tagId, BigDecimal userId) {
        this.tagId = tagId;
        this.userId = userId;
    }

    public TagLovedKey() {
        super();
    }

    public BigDecimal getTagId() {
        return tagId;
    }

    public void setTagId(BigDecimal tagId) {
        this.tagId = tagId;
    }

    public BigDecimal getUserId() {
        return userId;
    }

    public void setUserId(BigDecimal userId) {
        this.userId = userId;
    }
}