package top.guitoubing.service;

import top.guitoubing.pojo.Remark;
import top.guitoubing.pojo.RemarkData;

import java.math.BigDecimal;

public interface RemarkService {

    RemarkData getRemarkData(BigDecimal id);

    BigDecimal getMaxId();

    void addRemark(Remark remark);

}
