package top.guitoubing.service;

import top.guitoubing.pojo.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Dictionary;
import java.util.List;
import java.util.Map;

public interface UserService {

    User get(String tel);

    BigDecimal getMaxId();

    void register(User user);

    void update(User user);

    List<TagData> tags(BigDecimal id);

    List<ProfileTagData> tagsProfile(BigDecimal id);

    List<ProfileTagData> tagsLovedProfile(BigDecimal id);

    List<TagData> tagsLoved(BigDecimal id);

    List<MovieData> getMovieData(List<Movie> movies);

    List<MovieData> getMovieDataByKey(List<String> keys);

    List<Movie> getMovieByKey(List<String> keys);

    boolean loveMovie(BigDecimal uid, BigDecimal mid);

    MovieData movieDetail(Movie movie);

    User get(BigDecimal id);

    void addTagLoved(BigDecimal uid, BigDecimal tid);

    void updateTag(Tag tag);

    Tag getTag(BigDecimal id);

    void addTag(Tag tag);

    int countFollower(BigDecimal id);

    int countFollowed(BigDecimal id);

    List<User> selectFollower(BigDecimal id);

    List<User> selectFollowed(BigDecimal id);

    boolean checkFollowed(BigDecimal fid, BigDecimal uid);

    void addSubscribe(SubscribeKey subscribeKey);

    void deleteSubscribe(SubscribeKey subscribeKey);

    void addMovieLoved(MovieLovedKey movieLovedKey);


    void addMovieTag(BigDecimal movie_id, BigDecimal user_id);

    Map<BigDecimal,String> getLovedTagCovers(BigDecimal id);
//    List<MessageData> getMessageData(BigDecimal id);
//
//    MessageData getMessageDataFromMessage(Message message);
}
