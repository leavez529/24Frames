package top.guitoubing.pojo;

import java.math.BigDecimal;

public class MomentLovedKey {
    private BigDecimal userId;

    private BigDecimal momentId;

    public MomentLovedKey(BigDecimal userId, BigDecimal momentId) {
        this.userId = userId;
        this.momentId = momentId;
    }

    public MomentLovedKey() {
        super();
    }

    public BigDecimal getUserId() {
        return userId;
    }

    public void setUserId(BigDecimal userId) {
        this.userId = userId;
    }

    public BigDecimal getMomentId() {
        return momentId;
    }

    public void setMomentId(BigDecimal momentId) {
        this.momentId = momentId;
    }
}