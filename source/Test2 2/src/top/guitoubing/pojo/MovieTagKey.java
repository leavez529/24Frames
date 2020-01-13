package top.guitoubing.pojo;

import java.math.BigDecimal;

public class MovieTagKey {
    private BigDecimal movieId;

    private BigDecimal tagId;

    public MovieTagKey(BigDecimal movieId, BigDecimal tagId) {
        this.movieId = movieId;
        this.tagId = tagId;
    }

    public MovieTagKey() {
        super();
    }

    public BigDecimal getMovieId() {
        return movieId;
    }

    public void setMovieId(BigDecimal movieId) {
        this.movieId = movieId;
    }

    public BigDecimal getTagId() {
        return tagId;
    }

    public void setTagId(BigDecimal tagId) {
        this.tagId = tagId;
    }
}