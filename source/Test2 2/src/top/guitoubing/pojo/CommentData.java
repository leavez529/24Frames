package top.guitoubing.pojo;

import java.math.BigDecimal;

public class CommentData {

    private BigDecimal id;
    private Comment comment;
    private User user;

    public CommentData(BigDecimal id, Comment comment, User user) {
        this.id = id;
        this.comment = comment;
        this.user = user;
    }

    public CommentData(){
        super();
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
