package com.atguigu.springmvc.test;

import com.atguigu.springmvc.crud.dao.EmployeeDao;
import com.atguigu.springmvc.crud.entities.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collection;
import java.util.Map;

@Controller
public class SpringMVCTest {

    @Autowired
    private EmployeeDao employeeDao;

//    @ExceptionHandler({RuntimeException.class})
//    public ModelAndView handleArithmeticException2(Exception ex){
//        System.out.println("[Exception occurred!!]" + ex);
//        ModelAndView mv = new ModelAndView("error");
//        mv.addObject("exception", ex);
//        return mv;
//    }

//    /**
//     * 1. 在 @ExceptionHandler 方法的入参中可以加入 Exception 类型的参数，该参数即对应的发生的异常对象
//     * 2. 在 @ExceptionHandler 方法的入参中不能传入Map,若希望把异常信息传到页面上，需要使用ModelAndView 作为返回值
//     * 3. @ExceptionHandler方法标记的异常有优先级的问题
//     * @param ex
//     * @return
//     */
//    @ExceptionHandler({ArithmeticException.class})
//    public ModelAndView handleArithmeticException(Exception ex){
//        System.out.println("Exception occurred!!" + ex);
//        ModelAndView mv = new ModelAndView("error");
//        mv.addObject("exception", ex);
//        return mv;
//    }

    @RequestMapping("/testExceptionHandlerExceptionResolver")
    public String testExceptionHandlerExceptionResolver(@RequestParam("i") int i){
        System.out.println("result " + 10/i);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/testJson")
    public Collection<Employee> testJson(){
        return employeeDao.getAll();
    }

    @RequestMapping("/testConversionServiceConverer")
    public String testConverter(@RequestParam("employee") Employee employee) {
        System.out.println("save" + employee);
        employeeDao.save(employee);
        return "redirect:/emps";
    }
}
