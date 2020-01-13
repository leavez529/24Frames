package top.guitoubing.pojo;

import java.math.BigDecimal;

public class SubscribeKey {
    private BigDecimal sId;

    private BigDecimal byId;

    public SubscribeKey(BigDecimal sId, BigDecimal byId) {
        this.sId = sId;
        this.byId = byId;
    }

    public SubscribeKey() {
        super();
    }

    public BigDecimal getsId() {
        return sId;
    }

    public void setsId(BigDecimal sId) {
        this.sId = sId;
    }

    public BigDecimal getById() {
        return byId;
    }

    public void setById(BigDecimal byId) {
        this.byId = byId;
    }
}