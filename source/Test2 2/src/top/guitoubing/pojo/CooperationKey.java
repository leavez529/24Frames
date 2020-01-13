package top.guitoubing.pojo;

import java.math.BigDecimal;

public class CooperationKey {
    private BigDecimal actorId;

    private BigDecimal directorId;

    public CooperationKey(BigDecimal actorId, BigDecimal directorId) {
        this.actorId = actorId;
        this.directorId = directorId;
    }

    public CooperationKey() {
        super();
    }

    public BigDecimal getActorId() {
        return actorId;
    }

    public void setActorId(BigDecimal actorId) {
        this.actorId = actorId;
    }

    public BigDecimal getDirectorId() {
        return directorId;
    }

    public void setDirectorId(BigDecimal directorId) {
        this.directorId = directorId;
    }
}