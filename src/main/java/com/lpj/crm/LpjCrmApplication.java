package com.lpj.crm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@MapperScan("com.lpj.crm.mapper")
@SpringBootApplication
public class LpjCrmApplication {

    public static void main(String[] args) {
        SpringApplication.run(LpjCrmApplication.class, args);
    }

}