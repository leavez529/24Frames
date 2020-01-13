package top.guitoubing.pojo;

import java.math.BigDecimal;

public class DirectorPicKey {
    private BigDecimal directorId;

    private BigDecimal pictureId;

    public DirectorPicKey(BigDecimal directorId, BigDecimal pictureId) {
        this.directorId = directorId;
        this.pictureId = pictureId;
    }

    public DirectorPicKey() {
        super();
    }

    public BigDecimal getDirectorId() {
        return directorId;
    }

    public void setDirectorId(BigDecimal directorId) {
        this.directorId = directorId;
    }

    public BigDecimal getPictureId() {
        return pictureId;
    }

    public void setPictureId(BigDecimal pictureId) {
        this.pictureId = pictureId;
    }
}