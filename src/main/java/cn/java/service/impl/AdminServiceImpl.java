/**
 * Project Name:springboot2
 * File Name:AdminServiceImpl.java
 * Package Name:cn.java.service.impl
 * Date:下午5:29:09
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/

package cn.java.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.java.mapper.AdminMapper;
import cn.java.service.AdminService;

/**
 * Description: <br/>
 * Date: 下午5:29:09 <br/>
 * 
 * @author 丁鹏
 * @version
 * @see
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    /**
     * 简单描述该方法的实现功能（可选）.
     * 
     * @see cn.java.service.impl.AdminService#isLogin(java.lang.String,
     *      java.lang.String)
     */
    @Override
    public boolean isLogin(String username, String password) {
        int result = adminMapper.isLogin(username, password);
        if (result >= 1) {
            return true;
        }
        return false;
    }

    @Override
    public List<Map<String, Object>> selectNavs(String id) {
        return adminMapper.selectNavs(id);
    }

    @Override
    public Map<String, Object> getAllCaiDan(Integer page, Integer rows) {
        Integer startIndex = (page - 1) * rows;// 计算获取数据的索引
        // 1、获取10条记录
        List<Map<String, Object>> rowsList = adminMapper.getAllCaiDan(startIndex, rows);
        // 2、获取总条数
        int total = adminMapper.coutNavs();
        Map<String, Object> hm = new HashMap<String, Object>();
        hm.put("total", total);
        hm.put("rows", rowsList);
        return hm;
    }

    /**
     * 
     * 添加菜单
     * 
     * @see cn.java.service.AdminService#saveAdminNav(java.util.Map)
     */
    @Override
    public boolean saveAdminNav(Map<String, Object> paramsMap) {
        int flag = adminMapper.addAdminNav(paramsMap);
        if (flag >= 1) {
            return true;
        }
        return false;
    }

    /**
     * 
     * 批量删除
     * 
     * @see cn.java.service.AdminService#delNavs(java.lang.String)
     */
    @Override
    public boolean delNavs(String idStr) {
        idStr += "0";// "1,2,3,0"
        int flag = adminMapper.delNavs(idStr);
        if (flag >= 1) {
            return true;
        }
        return false;
    }
}
