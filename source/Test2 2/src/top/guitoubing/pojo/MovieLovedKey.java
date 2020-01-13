package top.guitoubing.pojo;

import java.math.BigDecimal;

public class MovieLovedKey {
    private BigDecimal userId;

    private BigDecimal movieId;

    public MovieLovedKey(BigDecimal userId, BigDecimal movieId) {
        this.userId = userId;
        this.movieId = movieId;
    }

    public MovieLovedKey() {
        super();
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
}