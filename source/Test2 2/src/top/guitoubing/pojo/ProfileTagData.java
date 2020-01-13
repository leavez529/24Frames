package top.guitoubing.pojo;

public class ProfileTagData {

    private Tag tag;
    private String cover;

    public Tag getTag() {
        return tag;
    }

    public void setTag(Tag tag) {
        this.tag = tag;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public ProfileTagData(){super();}

    public ProfileTagData(Tag tag, String cover) {
        this.tag = tag;
        this.cover = cover;
    }
}
