package top.guitoubing.pojo;

import java.math.BigDecimal;

public class MovieMusicKey {
    private BigDecimal movieId;

    private BigDecimal musicId;

    public MovieMusicKey(BigDecimal movieId, BigDecimal musicId) {
        this.movieId = movieId;
        this.musicId = musicId;
    }

    public MovieMusicKey() {
        super();
    }

    public BigDecimal getMovieId() {
        return movieId;
    }

    public void setMovieId(BigDecimal movieId) {
        this.movieId = movieId;
    }

    public BigDecimal getMusicId() {
        return musicId;
    }

    public void setMusicId(BigDecimal musicId) {
        this.musicId = musicId;
    }
}