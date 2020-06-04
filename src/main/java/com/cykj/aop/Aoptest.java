package com.cykj.aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Aoptest {

    /**
     * 纯java简单面向切面
     */
    public void test1(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("SpringAop.xml");
        Sleepable sleepable = (Sleepable)ac.getBean("student");
        sleepable.sleep();
    }

    /**
     * @Aspect注解形式
     *
     */
    public void test2(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("SpringAop1.xml");
        Sleepable sleepable = (Sleepable)ac.getBean("studentProxy");
        sleepable.sleep();
    }
    public static void main(String[] args) {
       Aoptest aoptest = new Aoptest();
//       aoptest.test1();
        aoptest.test2();
    }
}
