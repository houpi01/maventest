/**
 * Project Name:springboot2
 * File Name:FrontController.java
 * Package Name:cn.java.controller.front
 * Date:下午2:15:43
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/

package cn.java.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.java.service.FrontService;

/**
 * Description: <br/>
 * Date: 下午2:15:43 <br/>
 * 
 * @author 丁鹏
 * @version
 * @see
 */
@Controller
@RequestMapping("/front")
public class FrontController {

    @Autowired
    private FrontService frontService;

    @RequestMapping("/selectUser.do")
    @ResponseBody
    public int selectUser(String username, String password) {
        return frontService.getUser(username, password);
    }

    // ---------------------视图解析器-------------------------------------
    @RequestMapping("/testView.do")
    public String testView() {
        return "front/testView.jsp";
    }

}
