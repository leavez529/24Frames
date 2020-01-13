package top.guitoubing.pojo;

import java.math.BigDecimal;

public class MomentPicKey {
    private BigDecimal pictureId;

    private BigDecimal momentId;

    public MomentPicKey(BigDecimal pictureId, BigDecimal momentId) {
        this.pictureId = pictureId;
        this.momentId = momentId;
    }

    public MomentPicKey() {
        super();
    }

    public BigDecimal getPictureId() {
        return pictureId;
    }

    public void setPictureId(BigDecimal pictureId) {
        this.pictureId = pictureId;
    }

    public BigDecimal getMomentId() {
        return momentId;
    }

    public void setMomentId(BigDecimal momentId) {
        this.momentId = momentId;
    }
}