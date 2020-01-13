package top.guitoubing.service;

import top.guitoubing.pojo.Moment;
import top.guitoubing.pojo.MomentData;
import top.guitoubing.pojo.MomentLovedKey;
import top.guitoubing.pojo.MomentPicKey;

import java.math.BigDecimal;
import java.util.List;

public interface MomentService {

    Moment get(BigDecimal id);

    BigDecimal getMaxId();

    void addMoment(Moment moment);

    void addMomentPic(MomentPicKey momentPicKey);

    List<Moment> getMyMoments(BigDecimal id);

    List<Moment> getMoments(BigDecimal id);

    void comment(BigDecimal user_id, BigDecimal moment_id, String str);

    void share(BigDecimal user_id, String str, List<String> pic);

    MomentData getMomentDataByMoment(Moment moment);

    List<MomentData> getMomentData(List<Moment> moments);

    void addLove(MomentLovedKey momentLovedKey);

    void cancelLove(MomentLovedKey momentLovedKey);

}
