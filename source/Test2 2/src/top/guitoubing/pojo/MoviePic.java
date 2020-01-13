package top.guitoubing.pojo;

import java.math.BigDecimal;

public class MoviePic {
    private BigDecimal movieId;

    private BigDecimal pictureId;

    public MoviePic(BigDecimal movieId, BigDecimal pictureId) {
        this.movieId = movieId;
        this.pictureId = pictureId;
    }

    public MoviePic() {
        super();
    }

    public BigDecimal getMovieId() {
        return movieId;
    }

    public void setMovieId(BigDecimal movieId) {
        this.movieId = movieId;
    }

    public BigDecimal getPictureId() {
        return pictureId;
    }

    public void setPictureId(BigDecimal pictureId) {
        this.pictureId = pictureId;
    }
}