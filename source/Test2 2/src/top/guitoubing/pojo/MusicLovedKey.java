package top.guitoubing.pojo;

import java.math.BigDecimal;

public class MusicLovedKey {
    private BigDecimal userId;

    private BigDecimal musicId;

    public MusicLovedKey(BigDecimal userId, BigDecimal musicId) {
        this.userId = userId;
        this.musicId = musicId;
    }

    public MusicLovedKey() {
        super();
    }

    public BigDecimal getUserId() {
        return userId;
    }

    public void setUserId(BigDecimal userId) {
        this.userId = userId;
    }

    public BigDecimal getMusicId() {
        return musicId;
    }

    public void setMusicId(BigDecimal musicId) {
        this.musicId = musicId;
    }
}