package top.guitoubing.pojo;

import java.math.BigDecimal;

public class Movie {
    private BigDecimal id;

    private String name;

    private BigDecimal year;

    private BigDecimal length;

    private BigDecimal cover;

    private BigDecimal type;

    private BigDecimal region;

    private BigDecimal background;

    public Movie(BigDecimal id, String name, BigDecimal year, BigDecimal length, BigDecimal cover, BigDecimal type, BigDecimal region, BigDecimal background) {
        this.id = id;
        this.name = name;
        this.year = year;
        this.length = length;
        this.cover = cover;
        this.type = type;
        this.region = region;
        this.background = background;
    }

    public Movie() {
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

    public BigDecimal getYear() {
        return year;
    }

    public void setYear(BigDecimal year) {
        this.year = year;
    }

    public BigDecimal getLength() {
        return length;
    }

    public void setLength(BigDecimal length) {
        this.length = length;
    }

    public BigDecimal getCover() {
        return cover;
    }

    public void setCover(BigDecimal cover) {
        this.cover = cover;
    }

    public BigDecimal getType() {
        return type;
    }

    public void setType(BigDecimal type) {
        this.type = type;
    }

    public BigDecimal getRegion() {
        return region;
    }

    public void setRegion(BigDecimal region) {
        this.region = region;
    }

    public BigDecimal getBackground() {
        return background;
    }

    public void setBackground(BigDecimal background) {
        this.background = background;
    }
}