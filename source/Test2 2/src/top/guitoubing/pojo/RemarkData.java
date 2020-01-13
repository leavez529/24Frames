package top.guitoubing.pojo;

public class RemarkData {

    private Remark remark;
    private String username;
    private String movieName;

    public RemarkData(){
        super();
    }

    public RemarkData(Remark remark, String username, String movieName) {
        this.remark = remark;
        this.username = username;
        this.movieName = movieName;
    }

    public Remark getRemark() {
        return remark;
    }

    public void setRemark(Remark remark) {
        this.remark = remark;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }
}
