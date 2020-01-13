package top.guitoubing.pojo;

import java.math.BigDecimal;

public class ActorPicKey {
    private BigDecimal actorId;

    private BigDecimal pictureId;

    public ActorPicKey(BigDecimal actorId, BigDecimal pictureId) {
        this.actorId = actorId;
        this.pictureId = pictureId;
    }

    public ActorPicKey() {
        super();
    }

    public BigDecimal getActorId() {
        return actorId;
    }

    public void setActorId(BigDecimal actorId) {
        this.actorId = actorId;
    }

    public BigDecimal getPictureId() {
        return pictureId;
    }

    public void setPictureId(BigDecimal pictureId) {
        this.pictureId = pictureId;
    }
}