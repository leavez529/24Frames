package top.guitoubing.pojo;

import java.math.BigDecimal;

public class RemarkLovedKey {
    private BigDecimal userId;

    private BigDecimal remarkId;

    public RemarkLovedKey(BigDecimal userId, BigDecimal remarkId) {
        this.userId = userId;
        this.remarkId = remarkId;
    }

    public RemarkLovedKey() {
        super();
    }

    public BigDecimal getUserId() {
        return userId;
    }

    public void setUserId(BigDecimal userId) {
        this.userId = userId;
    }

    public BigDecimal getRemarkId() {
        return remarkId;
    }

    public void setRemarkId(BigDecimal remarkId) {
        this.remarkId = remarkId;
    }
}