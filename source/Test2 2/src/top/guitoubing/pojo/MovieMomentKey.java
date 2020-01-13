package top.guitoubing.pojo;

import java.math.BigDecimal;

public class MovieMomentKey {
    private BigDecimal movieId;

    private BigDecimal momentId;

    public MovieMomentKey(BigDecimal movieId, BigDecimal momentId) {
        this.movieId = movieId;
        this.momentId = momentId;
    }

    public MovieMomentKey() {
        super();
    }

    public BigDecimal getMovieId() {
        return movieId;
    }

    public void setMovieId(BigDecimal movieId) {
        this.movieId = movieId;
    }

    public BigDecimal getMomentId() {
        return momentId;
    }

    public void setMomentId(BigDecimal momentId) {
        this.momentId = momentId;
    }
}