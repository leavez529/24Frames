package top.guitoubing.pojo;

import java.math.BigDecimal;

public class MovieTag extends MovieTagKey {
    private String intro;

    public MovieTag(BigDecimal movieId, BigDecimal tagId, String intro) {
        super(movieId, tagId);
        this.intro = intro;
    }

    public MovieTag() {
        super();
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
    }
}