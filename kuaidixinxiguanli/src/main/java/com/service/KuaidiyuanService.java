package com.service;

import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.KuaidiyuanEntity;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 * 快递员 服务类
 */
public interface KuaidiyuanService extends IService<KuaidiyuanEntity> {

    /**
    * @param params 查询参数
    * @return 带分页的查询出来的数据
    */
     PageUtils queryPage(Map<String, Object> params);
}