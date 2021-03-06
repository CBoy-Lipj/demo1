package com.lpj.crm.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author PIGS
 * @since 2020-03-24
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("department")
public class Department extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Integer deptId;
    private String deptName;


}
