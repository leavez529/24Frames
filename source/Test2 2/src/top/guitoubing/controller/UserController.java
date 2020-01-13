package top.guitoubing.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import top.guitoubing.mapper.MovieLovedMapper;
import top.guitoubing.mapper.TagLovedMapper;
import top.guitoubing.pojo.*;
import top.guitoubing.service.*;
import top.guitoubing.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Dictionary;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    MovieService movieService;

    @Autowired
    PictureService pictureService;

    @Autowired
    RemarkService remarkService;

    @Autowired
    MomentService momentService;

    @Autowired
    MovieLovedMapper movieLovedMapper;

    @Autowired
    TagLovedMapper tagLovedMapper;

    @RequestMapping("register")
    public ModelAndView Register(User user, HttpServletRequest servletRequest){
        if (CheckUser.checkUser((User) servletRequest.getSession().getAttribute(ConstantDefinition.USERSESSION))){
            return new ModelAndView("redirect:/index");
        }
        ModelAndView modelAndView = new ModelAndView();
        User userTmp = userService.get(user.getTel());
        if (userTmp != null){
            modelAndView.addObject(ConstantDefinition.REGISTER_RETURN, ConstantDefinition.USER_EXISTS);
            modelAndView.setViewName("redirect:/login.jsp");
            return modelAndView;
        }
        user.setId(userService.getMaxId());
        user.setPassword(MD5Validate.getMd5(user.getPassword()));
        userService.register(user);
        modelAndView.setViewName("redirect:/login.jsp");
        return modelAndView;
    }

    @RequestMapping("login")
    public ModelAndView Login(User user, HttpServletRequest servletRequest){
        if (CheckUser.checkUser((User) servletRequest.getSession().getAttribute(ConstantDefinition.USERSESSION))){
            return new ModelAndView("redirect:/index");
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        // 验证用户是否存在
        User usertmp = userService.get(user.getTel());
        if (usertmp == null){
            modelAndView.addObject(ConstantDefinition.LOGIN_RETURN, ConstantDefinition.WRONG_USER);
            return modelAndView;
        }
        // 验证密码是否正确
        boolean success = MD5Validate.validateMd5(user.getPassword(), usertmp.getPassword());
        if (success){
            // 登录成功，添加用户session
            servletRequest.getSession().setAttribute(ConstantDefinition.USERSESSION, usertmp);
            modelAndView.setViewName("redirect:/index");
            return modelAndView;
        }else {
            modelAndView.addObject(ConstantDefinition.LOGIN_RETURN, ConstantDefinition.WRONG_PWD);
        }
        return modelAndView;
    }

    @RequestMapping("logout")
    public String Logout(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute(ConstantDefinition.USERSESSION);
        if (user != null){
            request.getSession().removeAttribute(ConstantDefinition.USERSESSION);
        }
        return "login";
    }

    @RequestMapping("index")
    public ModelAndView Index(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute(ConstantDefinition.USERSESSION);
        if (!CheckUser.checkUser(user)){
            return new ModelAndView("redirect:/login.jsp");
        }
        //User user = userService.get(BigDecimal.ONE);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(user);
        List<Movie> movies_1 = movieService.selectByType("爱情");
        List<Movie> movies_2 = movieService.selectByRegion("日本");
        List<Movie> movies_3 = movieService.selectByDirector("克里斯托弗•诺兰");

        List<MovieData> movies1 = userService.getMovieData(movies_1);
        List<MovieData> movies2 = userService.getMovieData(movies_2);
        List<MovieData> movies3 = userService.getMovieData(movies_3);
        modelAndView.addObject("movies1", movies1);
        modelAndView.addObject("movies2", movies2);
        modelAndView.addObject("movies3", movies3);
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping("tags")
    public ModelAndView Tags(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute(ConstantDefinition.USERSESSION);
        if (!CheckUser.checkUser(user)){
            return new ModelAndView("redirect:/login.jsp");
        }
   //     User user = userService.get(BigDecimal.ONE);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(user);
//        List<TagData> tagData = userService.tags(user.getId());
        //Dictionary<tagData, String>
        List<TagData> tagData = userService.tagsLoved(user.getId());
        Map<BigDecimal,String> covers = userService.getLovedTagCovers(user.getId());
        modelAndView.addObject("tags", tagData);
        modelAndView.addObject("covers",covers);
        modelAndView.setViewName("tags");

        return modelAndView;
    }

    @RequestMapping("search")
    public ModelAndView Search(String key, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute(ConstantDefinition.USERSESSION);
        if (!CheckUser.checkUser(user)){
            return new ModelAndView("redirect:/login.jsp");
        }
        //String key = request.getParameter("id");
       // User user = userService.get(BigDecimal.ONE);
        if (key == null || key.equals("")){
            key = ConstantDefinition.DEFAULT_SEARCH;
        }
        ArrayList<String> keys = MovieUtils.keySplit(key);
        List<MovieData> movieData = MovieUtils.removeDuplicate(userService.getMovieDataByKey(keys));
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(user);
        modelAndView.addObject("result", movieData);
        modelAndView.setViewName("search");
        return modelAndView;
    }

    @RequestMapping("detail")
    public ModelAndView Detail(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute(ConstantDefinition.USERSESSION);
        if (!CheckUser.checkUser(user)){
            return new ModelAndView("redirect:/login.jsp");
        }
      //  User user = userService.get(BigDecimal.ONE);
        BigDecimal movieId;
        if (request.getParameter("id") == null || request.getParameter("id").equals("")){
            movieId = BigDecimal.ONE;
        }else {
            movieId = BigDecimal.valueOf(Long.parseLong(request.getParameter("id")));
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(user);
        BigDecimal num = movieLovedMapper.getLoved(movieId);
        modelAndView.addObject("num",num);
        modelAndView.addObject("loved", userService.loveMovie(user.getId(), movieId));
        modelAndView.addObject("movieData", userService.movieDetail(movieService.get(movieId)));
        modelAndView.addObject("pictures", movieService.getPictures(movieId));
        modelAndView.addObject("musics", movieService.getMusics(movieId));
        modelAndView.addObject("remarks", movieService.gerRemarks(movieId));
        modelAndView.addObject("directors", movieService.getDirector(movieId));
        modelAndView.setViewName("detail");
        return modelAndView;
    }

    @RequestMapping("remark")
    public ModelAndView Remark(Remark remark, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute(ConstantDefinition.USERSESSION);
        if (!CheckUser.checkUser(user)){
            return new ModelAndView("redirect:/login.jsp");
        }
        remark.setId(remarkService.getMaxId());
        remarkService.addRemark(remark);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(user);
        modelAndView.setViewName("redirect:detail?id=" + remark.getMovieId());
        return modelAndView;
    }

    @RequestMapping("social")
    public ModelAndView Social(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute(ConstantDefinition.USERSESSION);
        if (!CheckUser.checkUser(user)){
            return new ModelAndView("redirect:/login.jsp");
        }
      //  User user =userService.get(BigDecimal.ONE);
        List<MomentData> momentData = momentService.getMomentData(momentService.getMoments(user.getId()));
//        上述已包含用户自己
//        momentData.addAll(momentService.getMomentData(momentService.getMyMoments(user.getId())));
//        MomentUtils.rankMoment(momentData);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user",user);
        modelAndView.addObject("moments", momentData);
        modelAndView.setViewName("social");
        return modelAndView;
    }

    @RequestMapping("addLove")
    public int AddLove(BigDecimal userId, BigDecimal momentId){
        momentService.addLove(new MomentLovedKey(userId, momentId));
        return 1;
    }

    @RequestMapping("cancelLove")
    public int CancelLove(BigDecimal userId, BigDecimal momentId){
        momentService.cancelLove(new MomentLovedKey(userId, momentId));
        return 0;
    }

    @RequestMapping("comment")
    public String AddComment(BigDecimal userId, BigDecimal momentId, String content){
        momentService.comment(userId, momentId, content);
        return userService.get(userId).getUsername();
    }

    @RequestMapping("moment")
    public ModelAndView Moment(HttpServletRequest request, BigDecimal userId, String content, String images){
//        if (pic.isEmpty()){
//            System.out.println("NULL");
//        }else {
//            // 获取名称
//            String originalFileName = pic.getOriginalFilename();
//            // 新的图片名称
//            String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
//            // 新的图片
//            File newFile = new File(newFileName);
//        }
        User user = (User) request.getSession().getAttribute(ConstantDefinition.USERSESSION);
        if (!CheckUser.checkUser(user)){
            return new ModelAndView("redirect:/login.jsp");
        }
        String[] fimages = images.split(" ");
        //User user = userService.get(BigDecimal.ONE);
        Moment moment = new Moment(momentService.getMaxId(), content, user.getId(), "0");
        momentService.addMoment(moment);
        for(String x: fimages){
            BigDecimal pic_id = pictureService.addPicture(x);
            momentService.addMomentPic(new MomentPicKey(pic_id, moment.getId()));
        }
        return Social(request);
    }

//    @RequestMapping("profile")
//    public ModelAndView Profile(HttpServletRequest request, @RequestParam("id") BigDecimal id){
//        User user = (User) request.getSession().getAttribute(ConstantDefinition.USERSESSION);
//        if (!CheckUser.checkUser(user)){
//            return new ModelAndView("redirect:/login.jsp");
//        }
//        Boolean self = false;
//        if (id.equals(user.getId())){
//            self = true;
//        }
//        List<MessageData> messageData = userService.getMessageData(id);
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.addObject(user);
//        modelAndView.addObject("view", userService.get(id));
//        modelAndView.addObject("messages", messageData);
//        modelAndView.setViewName("profile");
//        return modelAndView;
//    }

    @RequestMapping("mytags")
    public ModelAndView MyTags(HttpServletRequest request, @RequestParam("id") BigDecimal id){
        User user = (User) request.getSession().getAttribute(ConstantDefinition.USERSESSION);
        if (!CheckUser.checkUser(user)){
            return new ModelAndView("redirect:/login.jsp");
        }
        //User user = userService.get(BigDecimal.ONE);
        Boolean self = false;
        if (id.equals(user.getId())){
            self = true;
        }
//        User user = userService.get(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("self", self);
        modelAndView.addObject(user);
        modelAndView.addObject("view", userService.get(id));
        modelAndView.addObject("mytags", userService.tagsProfile(id));
        modelAndView.addObject("loved", userService.tagsLovedProfile(id));
        modelAndView.addObject("follower", userService.countFollower(id));
        modelAndView.addObject("followed", userService.countFollowed(id));
        modelAndView.setViewName("mytags");
        return modelAndView;
    }

    @RequestMapping("mymovies")
    public ModelAndView MyMovies(HttpServletRequest request, @RequestParam("id") BigDecimal id){
        User user = (User) request.getSession().getAttribute(ConstantDefinition.USERSESSION);
        if (!CheckUser.checkUser(user)){
            return new ModelAndView("redirect:/login.jsp");
        }
//        User user = userService.get(BigDecimal.ONE);
        Boolean self = false;
        if (id.equals(user.getId())){
            self = true;
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("self", self);
        modelAndView.addObject(user);
        modelAndView.addObject("view", userService.get(id));
        modelAndView.addObject("follower", userService.countFollower(id));
        modelAndView.addObject("followed", userService.countFollowed(id));
        List<Movie> movies = movieService.selectByUser(id);
        List<MovieData> movieData = userService.getMovieData(movies);
        modelAndView.addObject("movies", movieData);
        modelAndView.setViewName("mymovies");
        return modelAndView;
    }

    @RequestMapping("addTag")
    public void AddTag(BigDecimal userId, BigDecimal tagId){
        userService.addTagLoved(userId, tagId);
        Tag tag = userService.getTag(tagId);
        tag.setLove(tag.getLove().add(BigDecimal.ONE));
        userService.updateTag(tag);
    }

    @RequestMapping("searchFromTag")
    public void searchFromTag(String key, HttpServletResponse response){
        if (key == null || key.equals("")){
            key = ConstantDefinition.DEFAULT_SEARCH;
        }
        ArrayList<String> keys = MovieUtils.keySplit(key);
        List<Movie> movieData = MovieUtils.removeDuplicateMovie(userService.getMovieByKey(keys));
        try {
            String result = new ObjectMapper().writeValueAsString(movieData);
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("submitTag")
    public ModelAndView SubmitTag(BigDecimal userId, String tagname, String description, String movies, String cover_url, String background_url, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute(ConstantDefinition.USERSESSION);
        if (!CheckUser.checkUser(user)){
            return new ModelAndView("redirect:/login.jsp");
        }
//        User user = userService.get(BigDecimal.ONE);
        Tag tag = new Tag();
        String[] fmovies = movies.split("=");
        BigDecimal cover_id = pictureService.addPicture(cover_url);
        BigDecimal backgorund_id = pictureService.addPicture(background_url);
        tag.setName(tagname);
        tag.setIntro(description);
        tag.setCreator(userId);
        tag.setCoverPic(cover_id);
        tag.setBackgroudPic(backgorund_id);
        tag.setLove(BigDecimal.ZERO);
        userService.addTag(tag);
        for(String x : fmovies){
            userService.addMovieTag(movieService.get(new BigDecimal(x)).getId(), tag.getId());
        }
        TagLovedKey key = new TagLovedKey();
        key.setUserId(user.getId());
        key.setTagId(tag.getId());
        tagLovedMapper.insert(key);
        return new ModelAndView("redirect:/mytags?id=" + user.getId());
    }

    @RequestMapping("following")
    public ModelAndView Following(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute(ConstantDefinition.USERSESSION);
        if (!CheckUser.checkUser(user)){
            return new ModelAndView("redirect:/login.jsp");
        }
        List<User> followed = userService.selectFollowed(user.getId());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(user);
        modelAndView.addObject("follower", userService.countFollower(user.getId()));
        modelAndView.addObject("followed", userService.countFollowed(user.getId()));
        modelAndView.addObject("followedList", followed);
        modelAndView.addObject("self", true);
        modelAndView.setViewName("following");
        return modelAndView;
    }

    @RequestMapping("followers")
    public ModelAndView Followed(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute(ConstantDefinition.USERSESSION);
        if (!CheckUser.checkUser(user)){
            return new ModelAndView("redirect:/login.jsp");
        }
        List<User> follower = userService.selectFollower(user.getId());
        List<FollowedData> followedData = new ArrayList<>();
        for (User f : follower){
            followedData.add(new FollowedData(f, userService.checkFollowed(f.getId(), user.getId())));
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject(user);
        modelAndView.addObject("follower", userService.countFollower(user.getId()));
        modelAndView.addObject("followed", userService.countFollowed(user.getId()));
        modelAndView.addObject("followerList", followedData);
        modelAndView.addObject("self", true);
        modelAndView.setViewName("followers");

        return modelAndView;
    }

    @RequestMapping("cancelFollow")
    public void CancelFollow(BigDecimal fid, BigDecimal uid){
        userService.deleteSubscribe(new SubscribeKey(fid, uid));
    }

    @RequestMapping("addFollow")
    public void AddFollow(BigDecimal fid, BigDecimal uid){
        userService.addSubscribe(new SubscribeKey(fid, uid));
    }

    @RequestMapping("addMovieLike")
    public void AddMovieLike(BigDecimal movieId, BigDecimal userId){
        userService.addMovieLoved(new MovieLovedKey(userId, movieId));
    }

}
