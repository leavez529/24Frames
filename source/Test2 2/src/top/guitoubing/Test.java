package top.guitoubing;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import top.guitoubing.mapper.*;
import top.guitoubing.pojo.Movie;
import top.guitoubing.service.MovieService;
import top.guitoubing.service.PictureService;
import top.guitoubing.service.UserService;
import top.guitoubing.util.MovieUtils;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Test{
    @Autowired
    UserService userService;

    @Autowired
    UserMapper userMapper;

    @Autowired
    PictureMapper pictureMapper;

    @Autowired
    MovieMapper movieMapper;

    @Autowired
    MovieService movieService;

    @Autowired
    SubscribeMapper subscribeMapper;

    @Autowired
    MusicMapper musicMapper;

    @Autowired
    PictureService pictureService;



    @org.junit.Test
    public void TestUser(){
//        User user = userService.get("18936361545");
//        user.setId(BigDecimal.valueOf(4));
//        user.setTel("18936361546");
//        userService.register(user);
//        user.setUsername("谈瑞");
//        userService.update(user);
//        List list = MovieUtils.removeDuplicate(
//                userService.getMovieDataByKey(
//                        MovieUtils.keySplit("爱 乐  之 ")
//                )
//        );
//        list.clear();
        //System.out.println(musicMapper.selectByPrimaryKey(BigDecimal.ONE));
//        System.out.println(movieMapper.selectByPrimaryKey(BigDecimal.ONE));
//        System.out.println(userMapper.selectByPrimaryKey(BigDecimal.ONE));
//        System.out.println(userMapper.selectByTel("18936361545"));
          //pictureService.addPicture("123");
           // System.out.println(pictureService.getMaxId());
        //userService.addMovieTag(BigDecimal.valueOf(20),BigDecimal.valueOf(4));
//        Map<BigDecimal,String> test = userService.getLovedTagCovers(BigDecimal.ONE);
//        System.out.println(test.get(BigDecimal.ONE));
        List<Movie> m = movieService.getMoviesByTag(BigDecimal.ONE);
        List<String> pic = movieService.getCoversByTag(BigDecimal.ONE);

    }

}