package top.guitoubing.pojo;

import java.math.BigDecimal;

public class Region {
    private BigDecimal id;

    private String detail;

    public Region(BigDecimal id, String detail) {
        this.id = id;
        this.detail = detail;
    }

    public Region() {
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