package top.guitoubing.pojo;

public class Detail {
    private Long movieId;

    private String content;

    public Detail(Long movieId, String content) {
        this.movieId = movieId;
        this.content = content;
    }

    public Detail() {
        super();
    }

    public Long getMovieId() {
        return movieId;
    }

    public void setMovieId(Long movieId) {
        this.movieId = movieId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}