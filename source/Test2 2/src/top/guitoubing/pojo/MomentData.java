package top.guitoubing.pojo;

import java.math.BigDecimal;
import java.util.List;

public class MomentData {

    private BigDecimal id;
    private Moment moment;
    private User user;
    private List<BigDecimal> lovers;
    private String cover;
    private List<CommentData> commentData;

    public MomentData(){
        super();
    }

    public MomentData(BigDecimal id, Moment moment, User user, List<BigDecimal> lovers, String cover, List<CommentData> commentData) {
        this.id = id;
        this.moment = moment;
        this.user = user;
        this.lovers = lovers;
        this.cover = cover;
        this.commentData = commentData;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public Moment getMoment() {
        return moment;
    }

    public void setMoment(Moment moment) {
        this.moment = moment;
    }

    public List<BigDecimal> getLovers() {
        return lovers;
    }

    public void setLovers(List<BigDecimal> lovers) {
        this.lovers = lovers;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public List<CommentData> getCommentData() {
        return commentData;
    }

    public void setCommentData(List<CommentData> commentData) {
        this.commentData = commentData;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
