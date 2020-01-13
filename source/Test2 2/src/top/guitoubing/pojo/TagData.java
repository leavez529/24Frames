package top.guitoubing.pojo;

import java.util.List;

public class TagData {

    private Tag tag;

    private List<MovieData> movies;

    public TagData(){
        super();
    }

    public TagData(Tag tag, List<MovieData> movies) {
        this.tag = tag;
        this.movies = movies;
    }

    public Tag getTag() {
        return tag;
    }

    public void setTag(Tag tag) {
        this.tag = tag;
    }

    public List<MovieData> getMovies() {
        return movies;
    }

    public void setMovies(List<MovieData> movies) {
        this.movies = movies;
    }
}
