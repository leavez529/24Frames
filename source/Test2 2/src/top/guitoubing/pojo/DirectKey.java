package top.guitoubing.pojo;

import java.math.BigDecimal;

public class DirectKey {
    private BigDecimal directorId;

    private BigDecimal movieId;

    public DirectKey(BigDecimal directorId, BigDecimal movieId) {
        this.directorId = directorId;
        this.movieId = movieId;
    }

    public DirectKey() {
        super();
    }

    public BigDecimal getDirectorId() {
        return directorId;
    }

    public void setDirectorId(BigDecimal directorId) {
        this.directorId = directorId;
    }

    public BigDecimal getMovieId() {
        return movieId;
    }

    public void setMovieId(BigDecimal movieId) {
        this.movieId = movieId;
    }
}