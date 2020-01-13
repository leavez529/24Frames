package top.guitoubing.pojo;

import java.math.BigDecimal;

public class MovieData {

    private int id;
    private Movie movie;
    private String picture;
    private String backgroud;
    private String type;
    private String region;
    private String cover;
    private String detail;

    public MovieData(){
        super();
    }

    public MovieData(int id, Movie movie, String picture, String backgroud, String type, String region, String cover, String detail) {
        this.id = id;
        this.movie = movie;
        this.picture = picture;
        this.backgroud = backgroud;
        this.type = type;
        this.region = region;
        this.cover = cover;
        this.detail = detail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBackgroud() {

        return backgroud;
    }

    public void setBackgroud(String backgroud) {
        this.backgroud = backgroud;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
