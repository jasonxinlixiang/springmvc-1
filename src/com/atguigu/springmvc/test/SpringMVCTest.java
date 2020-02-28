package com.atguigu.springmvc.test;

import com.atguigu.springmvc.crud.dao.EmployeeDao;
import com.atguigu.springmvc.crud.entities.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collection;

@Controller
public class SpringMVCTest {

    @Autowired
    private EmployeeDao employeeDao;

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
