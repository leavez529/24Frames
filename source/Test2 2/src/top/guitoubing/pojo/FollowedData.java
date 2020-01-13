package top.guitoubing.pojo;

public class FollowedData {
    private User followed;
    private boolean love;

    public FollowedData(){super();}

    public FollowedData(User followed, boolean love) {
        this.followed = followed;
        this.love = love;
    }

    public User getFollowed() {
        return followed;
    }

    public void setFollowed(User followed) {
        this.followed = followed;
    }

    public boolean isLove() {
        return love;
    }

    public void setLove(boolean love) {
        this.love = love;
    }
}
