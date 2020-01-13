package top.guitoubing.pojo;

import java.math.BigDecimal;

public class Picture {
    private BigDecimal id;

    private String resource;

    public Picture(BigDecimal id, String resource) {
        this.id = id;
        this.resource = resource;
    }

    public Picture() {
        super();
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getResource() {
        return resource;
    }

    public void setResource(String resource) {
        this.resource = resource == null ? null : resource.trim();
    }
}