package top.guitoubing.pojo;

import java.math.BigDecimal;

public class Music {
    private BigDecimal id;

    private String name;

    private String resource;

    private String artist;

    public Music(BigDecimal id, String name, String resource, String artist) {
        this.id = id;
        this.name = name;
        this.resource = resource;
        this.artist = artist;
    }

    public Music() {
        super();
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getResource() {
        return resource;
    }

    public void setResource(String resource) {
        this.resource = resource == null ? null : resource.trim();
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist == null ? null : artist.trim();
    }
}