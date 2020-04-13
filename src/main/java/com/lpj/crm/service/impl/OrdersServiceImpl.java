package com.lpj.crm.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lpj.crm.entity.Customer;
import com.lpj.crm.entity.Employee;
import com.lpj.crm.entity.Orders;
import com.lpj.crm.mapper.CustomerMapper;
import com.lpj.crm.mapper.OrdersMapper;
import com.lpj.crm.service.OrdersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lpj.crm.utils.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author PIGS
 * @since 2020-03-29
 */
@Service
@Transactional
public class OrdersServiceImpl extends ServiceImpl<OrdersMapper, Orders> implements OrdersService {
    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private CustomerMapper customerMapper;
    @Override
    public IPage<Orders> selectOrders(Page<Orders> page) {
        Subject subject = SecurityUtils.getSubject();
        Employee employee = (Employee) subject.getPrincipal();
        return ordersMapper.selectOrders(page,employee.getEmpId());
    }

    @Override
    public Integer add(Orders orders) {
        orders.setCreateTime(StringUtils.getNowTime());
        orders.setUpdateTime(orders.getCreateTime());
        Integer a=ordersMapper.insert(orders);
        QueryWrapper<Customer> wrapper=new QueryWrapper<>();
        if (customerMapper.selectOne(wrapper.eq("cust_id",orders.getCustomerId()).eq("is_orders",1))==null){
            Customer custome=new Customer();
            custome.setCustId(orders.getCustomerId());
            custome.setIsOrders(1);
            customerMapper.updateById(custome);
        }
        return a;
    }
}
