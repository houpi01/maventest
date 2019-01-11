/**
 * Project Name:springboot2
 * File Name:AdminMapper.java
 * Package Name:cn.java.mapper
 * Date:下午5:27:21
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/

package cn.java.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * Description: easyui后台 <br/>
 * Date: 下午5:27:21 <br/>
 * 
 * @author 丁鹏
 * @version
 * @see
 */
public interface AdminMapper {

    /**
     * 
     * Description: 后台登录<br/>
     *
     * @author 丁鹏
     * @param username
     * @param password
     * @return
     */
    @Select("SELECT COUNT(*) AS num FROM users WHERE username=#{arg0} AND PASSWORD=#{arg1}")
    int isLogin(String username, String password);

    /**
     * 
     * Description: 查询后台导航栏信息<br/>
     *
     * @author 丁鹏
     * @return
     */
    @Select("SELECT * FROM admin_nav where pid=#{arg0}")
    List<Map<String, Object>> selectNavs(String id);

    /**
     * 
     * Description: 获取所有菜单信息<br/>
     *
     * @author 丁鹏
     * @return
     */
    @Select("SELECT * FROM admin_nav limit #{arg0},#{arg1}")
    List<Map<String, Object>> getAllCaiDan(Integer startIndex, Integer rows);

    /**
     * 
     * Description: 查询出admin_nav表中所有的记录条数<br/>
     *
     * @author 丁鹏
     * @return
     */
    @Select("SELECT COUNT(*) AS num FROM admin_nav")
    int coutNavs();

    /**
     * 
     * Description: 添加菜单<br/>
     *
     * @author 丁鹏
     * @param paramsMap
     * @return
     */
    @Insert("INSERT INTO admin_nav(`text`,state,iconCls,pid,href) VALUES(#{caiDanName},#{state},#{iconCls},#{pid},#{href})")
    int addAdminNav(Map<String, Object> paramsMap);

    /**
     * 
     * Description: 批量删除<br/>
     *
     * @author 丁鹏
     * @param idStr
     * @return
     */
    @Delete("DELETE FROM admin_nav WHERE id IN (${idStr})")
    int delNavs(@Param(value = "idStr") String idStr);
}
