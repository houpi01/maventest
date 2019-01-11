package cn.java.controller.front;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

@EnableAutoConfiguration
@ComponentScan(value = { "cn.java.controller.*", "cn.java.service.impl" })
@MapperScan(value = "cn.java.mapper")
public class ApplicationStrat {
	
	public static void main(String[] args) {
		SpringApplication.run(ApplicationStrat.class, args);
	}
	
}
