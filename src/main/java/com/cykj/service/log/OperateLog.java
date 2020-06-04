package com.cykj.service.log;


import java.lang.annotation.*;


/**
 * @author huangwb
 * @Email huangwb@gillion.com.cn
 * @date 2019/7/11
 * @time 17:25
 * @description:
 */

@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented

public @interface OperateLog {
    /**
     * 反射方法名称
     * @return
     */
    String methodName() default "";

    /**
     * 操作所属类型crud
     * @return
     */
    OperationTypeEnum operationType() default OperationTypeEnum.UNKNOW;

    /**
     * 操作所属模块 user variable apicase ...
     * @return
     */


    /**
     * 其他信息
     * @return
     */
    String remark() default "";

    enum OperationTypeEnum {
        UNKNOW,DELETE,INSERT,LOGIN


    }
}
