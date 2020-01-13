package top.guitoubing.pojo;

import java.math.BigDecimal;

public class Type {
    private BigDecimal id;

    private String detail;

    public Type(BigDecimal id, String detail) {
        this.id = id;
        this.detail = detail;
    }

    public Type() {
        super();
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }
}