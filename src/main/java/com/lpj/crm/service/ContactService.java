package com.lpj.crm.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lpj.crm.entity.Contact;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author PIGS
 * @since 2020-03-29
 */
public interface ContactService extends IService<Contact> {
    IPage<Contact> listCmC(Page<Contact> page);
}
