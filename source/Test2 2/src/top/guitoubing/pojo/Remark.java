package top.guitoubing.pojo;

import java.math.BigDecimal;

public class Remark {
    private BigDecimal id;

    private BigDecimal rating;

    private String content;

    private BigDecimal userId;

    private BigDecimal movieId;

    private BigDecimal like;

    public Remark(BigDecimal id, BigDecimal rating, String content, BigDecimal userId, BigDecimal movieId, BigDecimal like) {
        this.id = id;
        this.rating = rating;
        this.content = content;
        this.userId = userId;
        this.movieId = movieId;
        this.like = like;
    }

    public Remark() {
        super();
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
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

    public BigDecimal getMovieId() {
        return movieId;
    }

    public void setMovieId(BigDecimal movieId) {
        this.movieId = movieId;
    }

    public BigDecimal getLike() {
        return like;
    }

    public void setLike(BigDecimal like) {
        this.like = like;
    }
}