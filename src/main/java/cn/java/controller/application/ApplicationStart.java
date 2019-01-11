/**
 * Project Name:springboot2
 * File Name:ApplicationStart.java
 * Package Name:cn.java.controller.application
 * Date:下午2:42:26
 * Copyright (c) 2018, bluemobi All Rights Reserved.
 *
*/

package cn.java.controller.application;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Description: 只存放spring boot的启动代码<br/>
 * Date: 下午2:42:26 <br/>
 * 
 * @author 丁鹏
 * @version
 * @see
 */
@SpringBootApplication(scanBasePackages = { "cn.java.controller.*", "cn.java.service.impl" })
@MapperScan(value = "cn.java.mapper")
public class ApplicationStart {
    public static void main(String[] args) {
        // 启动spring boot
        SpringApplication.run(ApplicationStart.class, args);
    }
}
