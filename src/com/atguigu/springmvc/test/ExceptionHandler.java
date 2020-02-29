package com.atguigu.springmvc.test;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionHandler {

    /**
     * 1. 在 @ExceptionHandler 方法的入参中可以加入 Exception 类型的参数，该参数即对应的发生的异常对象
     * 2. 在 @ExceptionHandler 方法的入参中不能传入Map,若希望把异常信息传到页面上，需要使用ModelAndView 作为返回值
     * 3. @ExceptionHandler方法标记的异常有优先级的问题
     * 4. @ControllerAdvice :如果在当前handler中找不到 @ExceptionHandler 方法来处理当前方法出现的异常，
     * 则将去 @ControllerAdvice 标记的类中查找 @ExceptionHandler 标记的方法来处理异常
     * @param ex
     * @return
     */
    @org.springframework.web.bind.annotation.ExceptionHandler({ArithmeticException.class})
    public ModelAndView handleArithmeticException(Exception ex){
        System.out.println("Exception occurred!!" + ex);
        ModelAndView mv = new ModelAndView("error");
        mv.addObject("exception", ex);
        return mv;
    }
}
