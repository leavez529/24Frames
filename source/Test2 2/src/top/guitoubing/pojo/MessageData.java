package top.guitoubing.pojo;

import java.math.BigDecimal;

public class MessageData {
    private BigDecimal id;
    private Message message;
    private User user;

    public MessageData(){
        super();
    }

    public MessageData(BigDecimal id, Message message, User user) {
        this.id = id;
        this.message = message;
        this.user = user;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
