package top.guitoubing.util;

import top.guitoubing.pojo.MomentData;

import java.util.Comparator;
import java.util.List;

public class MomentUtils {

    public static void rankMoment(List<MomentData> momentData){
        momentData.sort(Comparator.comparing(MomentData::getId));
    }

}
