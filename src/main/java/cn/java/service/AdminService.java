/**
 * Project Name:springboot2
 * File Name:AdminService.java
 * Package Name:cn.java.service.impl
 * Date:下午5:31:18
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/

package cn.java.service;

import java.util.List;
import java.util.Map;

/**
 * Description: <br/>
 * Date: 下午5:31:18 <br/>
 * 
 * @author 丁鹏
 * @version
 * @see
 */
public interface AdminService {

    boolean isLogin(String username, String password);

    List<Map<String, Object>> selectNavs(String id);

    Map<String, Object> getAllCaiDan(Integer page, Integer rows);

    boolean saveAdminNav(Map<String, Object> paramsMap);

    boolean delNavs(String idStr);

}
