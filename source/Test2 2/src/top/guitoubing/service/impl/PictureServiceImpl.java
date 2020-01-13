package top.guitoubing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.guitoubing.mapper.PictureMapper;
import top.guitoubing.pojo.Picture;
import top.guitoubing.service.PictureService;

import java.math.BigDecimal;

@Service
class PictureServiceImpl implements PictureService{

    @Autowired
    PictureMapper pictureMapper;

    @Override
    public Picture get(BigDecimal id) {
        return pictureMapper.selectByPrimaryKey(id);
    }

    @Override
    public BigDecimal getMaxId() {
        return pictureMapper.getMaxId().add(BigDecimal.ONE);
    }

    @Override
    public BigDecimal addPicture(String url) {
        Picture picture = new Picture();
        BigDecimal id = this.getMaxId();
        picture.setId(id);
        picture.setResource(url);
        pictureMapper.insert(picture);
        return id;
    }
}
