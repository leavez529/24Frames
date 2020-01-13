package top.guitoubing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.guitoubing.mapper.*;
import top.guitoubing.pojo.*;
import top.guitoubing.service.MovieService;
import top.guitoubing.service.RemarkService;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class MovieServiceImpl implements MovieService {

    @Autowired
    MovieMapper movieMapper;

    @Autowired
    TypeMapper typeMapper;

    @Autowired
    RegionMapper regionMapper;

    @Autowired
    DirectorMapper directorMapper;

    @Autowired
    PictureMapper pictureMapper;

    @Autowired
    RemarkMapper remarkMapper;

    @Autowired
    MusicMapper musicMapper;

    @Autowired
    RemarkService remarkService;


    @Override
    public List<Movie> selectByType(String type) {
        return movieMapper.selectByType(type);
    }

    @Override
    public List<Movie> selectByRegion(String region) {
        return movieMapper.selectByRegion(region);
    }

    @Override
    public List<Movie> selectByDirector(String director) {
        return movieMapper.selectByDirector(director);
    }

    @Override
    public List<Movie> selectByUser(BigDecimal id) {
        return movieMapper.selectByUser(id);
    }

    @Override
    public List<Picture> getPictures(BigDecimal id) {
        return pictureMapper.selectByMovie(id);
    }

    @Override
    public List<RemarkData> gerRemarks(BigDecimal id) {
        List<Remark> remarks = remarkMapper.selectByMovie(id);
        List<RemarkData> remarkData = new ArrayList<>();
        for (Remark remark : remarks){
            remarkData.add(remarkService.getRemarkData(remark.getId()));
        }
        return remarkData;
    }

    @Override
    public List<Music> getMusics(BigDecimal id) {
        return musicMapper.selectByMovie(id);
    }

    @Override
    public List<Director> getDirector(BigDecimal id) {
        return directorMapper.selectByMovie(id);
    }

    @Override
    public Movie get(BigDecimal id) {
        return movieMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Movie> getMoviesByTag(BigDecimal id) {
        return movieMapper.selectByTag(id);
    }

    @Override
    public List<String> getCoversByTag(BigDecimal id) {
        List<String> url = new ArrayList<>();
        List<Movie> movies = this.getMoviesByTag(id);
        for(Movie m : movies){
            url.add(pictureMapper.selectByPrimaryKey(m.getCover()).getResource());

        }
        return url;
    }
}
