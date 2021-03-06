package com.lpj.crm.service.impl;

import com.lpj.crm.entity.Permission;
import com.lpj.crm.mapper.PermissionMapper;
import com.lpj.crm.service.PermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author PIGS
 * @since 2020-03-24
 */
@Service
@Transactional
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements PermissionService {

}
