package top.guitoubing.pojo;

import java.math.BigDecimal;

public class StaringKey {
    private BigDecimal actorId;

    private BigDecimal movieId;

    public StaringKey(BigDecimal actorId, BigDecimal movieId) {
        this.actorId = actorId;
        this.movieId = movieId;
    }

    public StaringKey() {
        super();
    }

    public BigDecimal getActorId() {
        return actorId;
    }

    public void setActorId(BigDecimal actorId) {
        this.actorId = actorId;
    }

    public BigDecimal getMovieId() {
        return movieId;
    }

    public void setMovieId(BigDecimal movieId) {
        this.movieId = movieId;
    }
}