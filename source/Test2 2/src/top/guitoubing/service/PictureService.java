package top.guitoubing.service;

import top.guitoubing.pojo.Picture;

import java.math.BigDecimal;

public interface PictureService {

    Picture get(BigDecimal id);

    BigDecimal getMaxId();

    BigDecimal addPicture(String url);

}
