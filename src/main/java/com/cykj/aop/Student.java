package com.cykj.aop;


/**
 * 实现类，实现Sleepable接口
 */
public class Student implements Sleepable {
    @Override
    public void sleep() {
        System.out.println("睡觉");
    }


}
