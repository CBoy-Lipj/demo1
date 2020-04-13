package com.lpj.crm.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DeptRole extends BaseEntity{
    private Integer deptId;

    private Integer roleId;
}
