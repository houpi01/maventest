/**
 * Project Name:springboot2
 * File Name:AdminController.java
 * Package Name:cn.java.controller.admin
 * Date:下午5:24:59
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/

package cn.java.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.java.service.AdminService;

/**
 * Description: <br/>
 * Date: 下午5:24:59 <br/>
 * 
 * @author 丁鹏
 * @version
 * @see
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    /**
     * 
     * Description: 后台登录方法<br/>
     *
     * @author 丁鹏
     * @param username
     * @param password
     * @return
     */
    @RequestMapping(value = "/isLogin.do")
    @ResponseBody
    public boolean isLogin(String username, String password) {
        System.out.println(username);
        return adminService.isLogin(username, password);
    }

    /**
     * 
     * Description: 获取导航栏信息<br/>
     *
     * @author 丁鹏
     * @return
     */
    @RequestMapping(value = "/getAllNavs.do")
    @ResponseBody
    public List<Map<String, Object>> getAllNavs(@RequestParam(defaultValue = "0") String id) {
        System.out.println("id=" + id);
        return adminService.selectNavs(id);
    }

    @RequestMapping(value = "/test.do")
    public void test(@RequestParam(required = true) String id) {
        System.out.println("-------------------");
    }

    /**
     * 
     * Description: 获取admin_nav表中的分页数据<br/>
     *
     * @author 丁鹏
     * @return
     */
    @RequestMapping(value = "/getAllCaiDan.do")
    @ResponseBody
    public Map<String, Object> getAllCaiDan(Integer page, Integer rows) {
        return adminService.getAllCaiDan(page, rows);
    }

    /**
     * 
     * Description: 添加菜单<br/>
     *
     * @author 丁鹏
     */
    @RequestMapping(value = "/addCaiDan.do")
    @ResponseBody
    public boolean addCaiDan(@RequestBody Map<String, Object> paramsMap) {
        return adminService.saveAdminNav(paramsMap);
    }

    /**
     * 
     * Description: 获取所有的一级菜单<br/>
     *
     * @author 丁鹏
     * @return
     */
    @RequestMapping(value = "/getFirstMenu.do")
    @ResponseBody
    public List<Map<String, Object>> getFirstMenu() {
        return adminService.selectNavs("0");
    }

    /**
     * 
     * Description: 批量删除<br/>
     *
     * @author 丁鹏
     * @param idStr
     * @return
     */
    @RequestMapping(value = "/batchDel.do")
    @ResponseBody
    public boolean batchDel(String idStr) {
        return adminService.delNavs(idStr);
    }
}
