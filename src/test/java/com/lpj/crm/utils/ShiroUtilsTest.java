package com.lpj.crm.utils;

import org.junit.jupiter.api.Test;

public class ShiroUtilsTest {
    @org.junit.jupiter.api.Test
    void randomSalt() {
        System.out.println("随机盐"+ShiroUtils.randomSalt());
    }

    @Test
    void encryptPassword() {
        System.out.println("密码"+ShiroUtils.encryptPassword("321456","lpj590e0e04678b"));
    }
}
