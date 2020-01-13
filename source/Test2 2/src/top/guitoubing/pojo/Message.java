package top.guitoubing.pojo;

import java.math.BigDecimal;

public class Message {
    private BigDecimal id;

    private BigDecimal from;

    private BigDecimal to;

    private String content;

    private String date;

    public Message(BigDecimal id, BigDecimal from, BigDecimal to, String content, String date) {
        this.id = id;
        this.from = from;
        this.to = to;
        this.content = content;
        this.date = date;
    }

    public Message() {
        super();
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public BigDecimal getFrom() {
        return from;
    }

    public void setFrom(BigDecimal from) {
        this.from = from;
    }

    public BigDecimal getTo() {
        return to;
    }

    public void setTo(BigDecimal to) {
        this.to = to;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }
}