package top.guitoubing.service;

import top.guitoubing.pojo.*;

import java.math.BigDecimal;
import java.util.List;

public interface MovieService {

    List<Movie> selectByType(String type);

    List<Movie> selectByRegion(String region);

    List<Movie> selectByDirector(String director);

    List<Movie> selectByUser(BigDecimal id);

    List<Picture> getPictures(BigDecimal id);

    List<RemarkData> gerRemarks(BigDecimal id);

    List<Music> getMusics(BigDecimal id );

    List<Director> getDirector(BigDecimal id);

    Movie get(BigDecimal id);

    List<Movie> getMoviesByTag(BigDecimal id);

    List<String> getCoversByTag(BigDecimal id);

}
