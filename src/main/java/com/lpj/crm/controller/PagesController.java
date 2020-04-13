package com.lpj.crm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lpj.crm.entity.Business;
import com.lpj.crm.entity.Customer;
import com.lpj.crm.entity.Employee;
import com.lpj.crm.entity.Orders;
import com.lpj.crm.service.BusinessService;
import com.lpj.crm.service.CustomerService;
import com.lpj.crm.service.EmployeeService;
import com.lpj.crm.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PagesController {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private BusinessService businessService;
    @GetMapping("/")
    public String index(){
        return "index";
    }

    @GetMapping("/welcome")
    public String welcome(Model model){
        QueryWrapper<Customer> customerQueryWrapper=new QueryWrapper<>();
        model.addAttribute("zhenshi",customerService.count(customerQueryWrapper.eq("is_orders",1).eq("is_del",0)));
        QueryWrapper<Customer> customerQueryWrapper2=new QueryWrapper<>();
        model.addAttribute("buzhenshi",customerService.count(customerQueryWrapper2.eq("is_orders",0).eq("is_del",0)));
        QueryWrapper<Orders> ordersQueryWrapper=new QueryWrapper<>();
        model.addAttribute("orders",ordersService.count(ordersQueryWrapper.eq("is_del",0)));
        QueryWrapper<Employee> employeeQueryWrapper=new QueryWrapper<>();
        model.addAttribute("emp",employeeService.count(employeeQueryWrapper.eq("is_del",0)));
        QueryWrapper<Business> businessQueryWrapper=new QueryWrapper<>();
        model.addAttribute("bus",businessService.count(businessQueryWrapper.eq("is_del",0)));
        return "welcome";
    }
    @GetMapping("/index")
    public String indexa(){
        return "index";
    }
}
